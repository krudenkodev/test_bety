import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot.freezed.dart';

enum SlotStatus { available, disabled }

enum SlotDisabledReason {
  past('Час уже минув'),
  overlapsAppointment('Перетинається з записом клієнта'),
  overlapsBreak('Перетинається з обідом'),
  outOfWorkingDay('Виходить за межі робочого дня');

  final String message;
  const SlotDisabledReason(this.message);
}

@freezed
class Slot with _$Slot {
  const Slot._();

  const factory Slot({
    required DateTime start,
    required DateTime end,
    required SlotStatus status,
    SlotDisabledReason? reason,
  }) = _Slot;

  bool get isAvailable => status == SlotStatus.available;
}
