// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkingHours _$WorkingHoursFromJson(Map<String, dynamic> json) {
  return _WorkingHours.fromJson(json);
}

/// @nodoc
mixin _$WorkingHours {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;
  List<BreakInterval> get breaks => throw _privateConstructorUsedError;

  /// Serializes this WorkingHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkingHoursCopyWith<WorkingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingHoursCopyWith<$Res> {
  factory $WorkingHoursCopyWith(
    WorkingHours value,
    $Res Function(WorkingHours) then,
  ) = _$WorkingHoursCopyWithImpl<$Res, WorkingHours>;
  @useResult
  $Res call({String start, String end, List<BreakInterval> breaks});
}

/// @nodoc
class _$WorkingHoursCopyWithImpl<$Res, $Val extends WorkingHours>
    implements $WorkingHoursCopyWith<$Res> {
  _$WorkingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null, Object? breaks = null}) {
    return _then(
      _value.copyWith(
            start: null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                      as String,
            end: null == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                      as String,
            breaks: null == breaks
                ? _value.breaks
                : breaks // ignore: cast_nullable_to_non_nullable
                      as List<BreakInterval>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkingHoursImplCopyWith<$Res>
    implements $WorkingHoursCopyWith<$Res> {
  factory _$$WorkingHoursImplCopyWith(
    _$WorkingHoursImpl value,
    $Res Function(_$WorkingHoursImpl) then,
  ) = __$$WorkingHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end, List<BreakInterval> breaks});
}

/// @nodoc
class __$$WorkingHoursImplCopyWithImpl<$Res>
    extends _$WorkingHoursCopyWithImpl<$Res, _$WorkingHoursImpl>
    implements _$$WorkingHoursImplCopyWith<$Res> {
  __$$WorkingHoursImplCopyWithImpl(
    _$WorkingHoursImpl _value,
    $Res Function(_$WorkingHoursImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null, Object? breaks = null}) {
    return _then(
      _$WorkingHoursImpl(
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as String,
        end: null == end
            ? _value.end
            : end // ignore: cast_nullable_to_non_nullable
                  as String,
        breaks: null == breaks
            ? _value._breaks
            : breaks // ignore: cast_nullable_to_non_nullable
                  as List<BreakInterval>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkingHoursImpl implements _WorkingHours {
  const _$WorkingHoursImpl({
    required this.start,
    required this.end,
    final List<BreakInterval> breaks = const <BreakInterval>[],
  }) : _breaks = breaks;

  factory _$WorkingHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkingHoursImplFromJson(json);

  @override
  final String start;
  @override
  final String end;
  final List<BreakInterval> _breaks;
  @override
  @JsonKey()
  List<BreakInterval> get breaks {
    if (_breaks is EqualUnmodifiableListView) return _breaks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breaks);
  }

  @override
  String toString() {
    return 'WorkingHours(start: $start, end: $end, breaks: $breaks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingHoursImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._breaks, _breaks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    start,
    end,
    const DeepCollectionEquality().hash(_breaks),
  );

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingHoursImplCopyWith<_$WorkingHoursImpl> get copyWith =>
      __$$WorkingHoursImplCopyWithImpl<_$WorkingHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkingHoursImplToJson(this);
  }
}

abstract class _WorkingHours implements WorkingHours {
  const factory _WorkingHours({
    required final String start,
    required final String end,
    final List<BreakInterval> breaks,
  }) = _$WorkingHoursImpl;

  factory _WorkingHours.fromJson(Map<String, dynamic> json) =
      _$WorkingHoursImpl.fromJson;

  @override
  String get start;
  @override
  String get end;
  @override
  List<BreakInterval> get breaks;

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkingHoursImplCopyWith<_$WorkingHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
