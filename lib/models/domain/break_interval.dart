import 'package:freezed_annotation/freezed_annotation.dart';

part 'break_interval.freezed.dart';
part 'break_interval.g.dart';

@freezed
class BreakInterval with _$BreakInterval {
  const factory BreakInterval({
    required String start,
    required String end,
    required String label,
  }) = _BreakInterval;

  factory BreakInterval.fromJson(Map<String, dynamic> json) => _$BreakIntervalFromJson(json);
}
