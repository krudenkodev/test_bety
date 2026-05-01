// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkingHoursImpl _$$WorkingHoursImplFromJson(Map<String, dynamic> json) =>
    _$WorkingHoursImpl(
      start: json['start'] as String,
      end: json['end'] as String,
      breaks:
          (json['breaks'] as List<dynamic>?)
              ?.map((e) => BreakInterval.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BreakInterval>[],
    );

Map<String, dynamic> _$$WorkingHoursImplToJson(_$WorkingHoursImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'breaks': instance.breaks,
    };
