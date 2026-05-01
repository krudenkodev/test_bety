// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingDataImpl _$$BookingDataImplFromJson(Map<String, dynamic> json) =>
    _$BookingDataImpl(
      workingHours: WorkingHours.fromJson(
        json['workingHours'] as Map<String, dynamic>,
      ),
      bufferMinutes: (json['bufferMinutes'] as num).toInt(),
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingDataImplToJson(_$BookingDataImpl instance) =>
    <String, dynamic>{
      'workingHours': instance.workingHours,
      'bufferMinutes': instance.bufferMinutes,
      'services': instance.services,
      'appointments': instance.appointments,
    };
