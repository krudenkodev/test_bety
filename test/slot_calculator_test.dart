import 'package:flutter_test/flutter_test.dart';
import 'package:test_bety/models/domain/appointment.dart';
import 'package:test_bety/models/domain/booking_data.dart';
import 'package:test_bety/models/domain/break_interval.dart';
import 'package:test_bety/models/domain/service.dart';
import 'package:test_bety/models/domain/slot.dart';
import 'package:test_bety/models/domain/working_hours.dart';
import 'package:test_bety/services/slot_calculator.dart';

void main() {
  const calculator = SlotCalculator();

  // Anchor day far in the future so "isToday" is false unless we want it.
  final day = DateTime(2030, 1, 15);

  BookingData buildData({
    String start = '10:00',
    String end = '20:00',
    List<BreakInterval> breaks = const [
      BreakInterval(start: '14:00', end: '15:00', label: 'Обід'),
    ],
    int bufferMinutes = 15,
    List<Service> services = const [
      Service(id: 's30', name: 'Брови', durationMinutes: 30),
      Service(id: 's60', name: 'Манікюр', durationMinutes: 60),
      Service(id: 's90', name: 'Педикюр', durationMinutes: 90),
      Service(id: 's150', name: 'Комплекс', durationMinutes: 150),
    ],
    List<Appointment> appointments = const [],
  }) {
    return BookingData(
      workingHours: WorkingHours(start: start, end: end, breaks: breaks),
      bufferMinutes: bufferMinutes,
      services: services,
      appointments: appointments,
    );
  }

  Appointment apt(String start, String end, {String id = 'x', String? date}) {
    return Appointment(
      id: id,
      date: day,
      start: start,
      end: end,
      clientName: 'Test',
    );
  }

  Service serviceOf(BookingData data, String id) =>
      data.services.firstWhere((s) => s.id == id);

  Slot? slotAt(List<Slot> slots, String hhmm) {
    final parts = hhmm.split(':');
    final h = int.parse(parts[0]);
    final m = int.parse(parts[1]);
    for (final s in slots) {
      if (s.start.hour == h && s.start.minute == m) return s;
    }
    return null;
  }

  group('grid generation', () {
    test('15-minute step from working day start', () {
      final data = buildData(appointments: const []);
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      expect(slots.first.start.hour, 10);
      expect(slots.first.start.minute, 0);
      expect(slots[1].start.minute, 15);
      expect(slots[2].start.minute, 30);
    });

    test('last slot end equal to working day end is allowed', () {
      final data = buildData();
      final slots = calculator.calculate(
        service: serviceOf(data, 's60'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      final lastAvailable =
          slots.where((s) => s.isAvailable).toList().last;
      expect(lastAvailable.start.hour, 19);
      expect(lastAvailable.start.minute, 0);
      expect(lastAvailable.end.hour, 20);
      expect(lastAvailable.end.minute, 0);
    });

    test('slots that exceed working day are out-of-day', () {
      final data = buildData();
      final slots = calculator.calculate(
        service: serviceOf(data, 's60'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      expect(slotAt(slots, '19:15')?.reason,
          SlotDisabledReason.outOfWorkingDay);
      expect(slotAt(slots, '19:30')?.reason,
          SlotDisabledReason.outOfWorkingDay);
    });
  });

  group('break handling', () {
    test('slot starting 10 min before break is disabled', () {
      final data = buildData();
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // 13:50 isn't on grid, but 13:45 with 30min ends 14:15 → overlaps break.
      expect(slotAt(slots, '13:45')?.reason,
          SlotDisabledReason.overlapsBreak);
    });

    test('slot ending exactly at break start is allowed (no buffer at break)', () {
      final data = buildData();
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // 13:30 with 30min ends 14:00 == break start → does NOT overlap.
      expect(slotAt(slots, '13:30')?.isAvailable, true);
    });

    test('slot starting exactly at break end is allowed', () {
      final data = buildData();
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      expect(slotAt(slots, '15:00')?.isAvailable, true);
    });
  });

  group('appointment buffer', () {
    test('buffer enforced before existing appointment', () {
      final data = buildData(appointments: [apt('11:00', '12:00')]);
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // 30min slot starting 10:30 ends 11:00 → must end <= 10:45 → disabled.
      expect(slotAt(slots, '10:30')?.reason,
          SlotDisabledReason.overlapsAppointment);
      // 10:15 ends 10:45 → boundary OK.
      expect(slotAt(slots, '10:15')?.isAvailable, true);
    });

    test('buffer enforced after existing appointment', () {
      final data = buildData(appointments: [apt('11:00', '12:00')]);
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // 12:00 start would overlap apt; 12:15 is the earliest valid start.
      expect(slotAt(slots, '12:00')?.reason,
          SlotDisabledReason.overlapsAppointment);
      expect(slotAt(slots, '12:15')?.isAvailable, true);
    });
  });

  group('today / past time', () {
    test('past slots on today are disabled', () {
      final data = buildData();
      final today = DateTime(2030, 1, 15);
      final now = DateTime(2030, 1, 15, 13, 47);
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: today,
        data: data,
        now: now,
      );
      // 13:30 < 13:47 → past.
      expect(slotAt(slots, '13:30')?.reason, SlotDisabledReason.past);
      // 14:00 > 13:47 → not past (but overlaps break, which is checked
      //   only if the slot isn't already in the past). We want past not to apply.
      // 13:45 < 13:47 → past.
      expect(slotAt(slots, '13:45')?.reason, SlotDisabledReason.past);
      // 13:47 itself isn't on grid; 13:47 → use 14:15 which is after now.
      expect(slotAt(slots, '15:00')?.isAvailable, true);
    });

    test('slot at 14:00 available when now is 13:47 (no buffer to now)', () {
      // service 30min at 14:00 would overlap break — choose 60min service after break.
      final data = buildData();
      final today = DateTime(2030, 1, 15);
      final now = DateTime(2030, 1, 15, 13, 47);
      final slots = calculator.calculate(
        service: serviceOf(data, 's60'),
        date: today,
        data: data,
        now: now,
      );
      // 14:00 with 60min spans 14-15, fully overlaps break — disabled by break,
      //   but NOT past. Verify reason isn't `past`.
      expect(slotAt(slots, '14:00')?.reason,
          isNot(SlotDisabledReason.past));
      // 15:00 onward future + outside break — available.
      expect(slotAt(slots, '15:00')?.isAvailable, true);
    });
  });

  group('edge cases from spec', () {
    test('150 min service on tightly booked day yields zero available slots',
        () {
      // Window scheme reproduces the user's fixture for 2026-05-05.
      final data = buildData(appointments: [
        apt('11:00', '12:00', id: 'a1'),
        apt('16:00', '17:00', id: 'a2'),
        apt('19:00', '19:30', id: 'a3'),
      ]);
      final slots = calculator.calculate(
        service: serviceOf(data, 's150'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      expect(slots.where((s) => s.isAvailable), isEmpty);
    });

    test('90 min service near end of day: tail of grid out-of-day', () {
      final data = buildData();
      final slots = calculator.calculate(
        service: serviceOf(data, 's90'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // 90min service: last valid start is 18:30 (ends 20:00).
      expect(slotAt(slots, '18:30')?.isAvailable, true);
      expect(slotAt(slots, '18:45')?.reason,
          SlotDisabledReason.outOfWorkingDay);
    });

    test('switching service from 30 to 150 min disables previously valid slots',
        () {
      final data = buildData();
      final s30 = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      final s150 = calculator.calculate(
        service: serviceOf(data, 's150'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // 11:00 with 30min ends 11:30 → no break overlap → available.
      expect(slotAt(s30, '11:00')?.isAvailable, true);
      // 11:00 with 150min ends 13:30, within morning window, still available.
      expect(slotAt(s150, '11:00')?.isAvailable, true);
      // 12:00 with 30min ends 12:30 → available.
      expect(slotAt(s30, '12:00')?.isAvailable, true);
      // 12:00 with 150min ends 14:30 → overlaps break → disabled.
      expect(slotAt(s150, '12:00')?.reason,
          SlotDisabledReason.overlapsBreak);
    });

    test('two appointments with min buffer leave no valid start between', () {
      final data = buildData(appointments: [
        apt('11:00', '12:00', id: 'a1'),
        apt('12:30', '13:00', id: 'a2'),
      ]);
      final slots = calculator.calculate(
        service: serviceOf(data, 's30'),
        date: day,
        data: data,
        now: DateTime(2030, 1, 1),
      );
      // No 30min slot fits between [12:15..12:15] gap.
      final between = slots.where((s) =>
          !s.start.isBefore(DateTime(day.year, day.month, day.day, 12, 0)) &&
          s.start.isBefore(DateTime(day.year, day.month, day.day, 13, 0)));
      expect(between.every((s) => !s.isAvailable), true);
    });
  });
}
