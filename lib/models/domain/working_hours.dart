import 'package:freezed_annotation/freezed_annotation.dart';

import 'break_interval.dart';

part 'working_hours.freezed.dart';
part 'working_hours.g.dart';

@freezed
class WorkingHours with _$WorkingHours {
  const factory WorkingHours({
    required String start,
    required String end,
    @Default(<BreakInterval>[]) List<BreakInterval> breaks,
  }) = _WorkingHours;

  factory WorkingHours.fromJson(Map<String, dynamic> json) => _$WorkingHoursFromJson(json);
}
