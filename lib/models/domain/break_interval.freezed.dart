// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'break_interval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BreakInterval _$BreakIntervalFromJson(Map<String, dynamic> json) {
  return _BreakInterval.fromJson(json);
}

/// @nodoc
mixin _$BreakInterval {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this BreakInterval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakIntervalCopyWith<BreakInterval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakIntervalCopyWith<$Res> {
  factory $BreakIntervalCopyWith(
    BreakInterval value,
    $Res Function(BreakInterval) then,
  ) = _$BreakIntervalCopyWithImpl<$Res, BreakInterval>;
  @useResult
  $Res call({String start, String end, String label});
}

/// @nodoc
class _$BreakIntervalCopyWithImpl<$Res, $Val extends BreakInterval>
    implements $BreakIntervalCopyWith<$Res> {
  _$BreakIntervalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null, Object? label = null}) {
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
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreakIntervalImplCopyWith<$Res>
    implements $BreakIntervalCopyWith<$Res> {
  factory _$$BreakIntervalImplCopyWith(
    _$BreakIntervalImpl value,
    $Res Function(_$BreakIntervalImpl) then,
  ) = __$$BreakIntervalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end, String label});
}

/// @nodoc
class __$$BreakIntervalImplCopyWithImpl<$Res>
    extends _$BreakIntervalCopyWithImpl<$Res, _$BreakIntervalImpl>
    implements _$$BreakIntervalImplCopyWith<$Res> {
  __$$BreakIntervalImplCopyWithImpl(
    _$BreakIntervalImpl _value,
    $Res Function(_$BreakIntervalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null, Object? label = null}) {
    return _then(
      _$BreakIntervalImpl(
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as String,
        end: null == end
            ? _value.end
            : end // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakIntervalImpl implements _BreakInterval {
  const _$BreakIntervalImpl({
    required this.start,
    required this.end,
    required this.label,
  });

  factory _$BreakIntervalImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakIntervalImplFromJson(json);

  @override
  final String start;
  @override
  final String end;
  @override
  final String label;

  @override
  String toString() {
    return 'BreakInterval(start: $start, end: $end, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakIntervalImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, label);

  /// Create a copy of BreakInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakIntervalImplCopyWith<_$BreakIntervalImpl> get copyWith =>
      __$$BreakIntervalImplCopyWithImpl<_$BreakIntervalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakIntervalImplToJson(this);
  }
}

abstract class _BreakInterval implements BreakInterval {
  const factory _BreakInterval({
    required final String start,
    required final String end,
    required final String label,
  }) = _$BreakIntervalImpl;

  factory _BreakInterval.fromJson(Map<String, dynamic> json) =
      _$BreakIntervalImpl.fromJson;

  @override
  String get start;
  @override
  String get end;
  @override
  String get label;

  /// Create a copy of BreakInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakIntervalImplCopyWith<_$BreakIntervalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
