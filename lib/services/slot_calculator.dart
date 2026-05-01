import '../models/domain/booking_data.dart';
import '../models/domain/service.dart';
import '../models/domain/slot.dart';

class SlotCalculator {
  static const Duration step = Duration(minutes: 15);

  const SlotCalculator();

  List<Slot> calculate({
    required Service service,
    required DateTime date,
    required BookingData data,
    required DateTime now,
  }) {
    final dayStart = _combine(date, data.workingHours.start);
    final dayEnd = _combine(date, data.workingHours.end);
    final duration = Duration(minutes: service.durationMinutes);
    final buffer = Duration(minutes: data.bufferMinutes);
    final breaks = data.workingHours.breaks
        .map((b) => _Range(_combine(date, b.start), _combine(date, b.end)))
        .toList(growable: false);
    final dayAppointments = data.appointments
        .where((a) => _isSameDay(a.date, date))
        .map((a) => _Range(_combine(date, a.start), _combine(date, a.end)))
        .toList(growable: false);
    final isToday = _isSameDay(now, date);

    final slots = <Slot>[];
    var slotStart = dayStart;

    while (!slotStart.isAfter(dayEnd)) {
      final slotEnd = slotStart.add(duration);

      final reason = _resolveReason(
        slotStart: slotStart,
        slotEnd: slotEnd,
        dayEnd: dayEnd,
        breaks: breaks,
        appointments: dayAppointments,
        buffer: buffer,
        now: now,
        isToday: isToday,
      );

      slots.add(
        Slot(
          start: slotStart,
          end: slotEnd,
          status: reason == null ? SlotStatus.available : SlotStatus.disabled,
          reason: reason,
        ),
      );

      slotStart = slotStart.add(step);
    }

    return slots;
  }

  SlotDisabledReason? _resolveReason({
    required DateTime slotStart,
    required DateTime slotEnd,
    required DateTime dayEnd,
    required List<_Range> breaks,
    required List<_Range> appointments,
    required Duration buffer,
    required DateTime now,
    required bool isToday,
  }) {
    if (isToday && slotStart.isBefore(now)) {
      return SlotDisabledReason.past;
    }
    if (slotEnd.isAfter(dayEnd)) {
      return SlotDisabledReason.outOfWorkingDay;
    }
    for (final br in breaks) {
      if (_overlaps(slotStart, slotEnd, br.start, br.end)) {
        return SlotDisabledReason.overlapsBreak;
      }
    }
    for (final apt in appointments) {
      final guardedStart = apt.start.subtract(buffer);
      final guardedEnd = apt.end.add(buffer);
      if (_overlaps(slotStart, slotEnd, guardedStart, guardedEnd)) {
        return SlotDisabledReason.overlapsAppointment;
      }
    }
    return null;
  }

  bool _overlaps(
    DateTime aStart,
    DateTime aEnd,
    DateTime bStart,
    DateTime bEnd,
  ) {
    return aStart.isBefore(bEnd) && bStart.isBefore(aEnd);
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  DateTime _combine(DateTime date, String hhmm) {
    final parts = hhmm.split(':');
    return DateTime(
      date.year,
      date.month,
      date.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }
}

class _Range {
  final DateTime start;
  final DateTime end;

  const _Range(this.start, this.end);
}
