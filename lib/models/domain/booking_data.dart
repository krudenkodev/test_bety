import 'package:freezed_annotation/freezed_annotation.dart';

import 'appointment.dart';
import 'service.dart';
import 'working_hours.dart';

part 'booking_data.freezed.dart';
part 'booking_data.g.dart';

@freezed
class BookingData with _$BookingData {
  const factory BookingData({
    required WorkingHours workingHours,
    required int bufferMinutes,
    required List<Service> services,
    required List<Appointment> appointments,
  }) = _BookingData;

  factory BookingData.fromJson(Map<String, dynamic> json) => _$BookingDataFromJson(json);
}
