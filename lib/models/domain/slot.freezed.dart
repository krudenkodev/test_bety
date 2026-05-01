// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Slot {
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  SlotStatus get status => throw _privateConstructorUsedError;
  SlotDisabledReason? get reason => throw _privateConstructorUsedError;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlotCopyWith<Slot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotCopyWith<$Res> {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) then) =
      _$SlotCopyWithImpl<$Res, Slot>;
  @useResult
  $Res call({
    DateTime start,
    DateTime end,
    SlotStatus status,
    SlotDisabledReason? reason,
  });
}

/// @nodoc
class _$SlotCopyWithImpl<$Res, $Val extends Slot>
    implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? status = null,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            start: null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            end: null == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SlotStatus,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as SlotDisabledReason?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SlotImplCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$$SlotImplCopyWith(
    _$SlotImpl value,
    $Res Function(_$SlotImpl) then,
  ) = __$$SlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime start,
    DateTime end,
    SlotStatus status,
    SlotDisabledReason? reason,
  });
}

/// @nodoc
class __$$SlotImplCopyWithImpl<$Res>
    extends _$SlotCopyWithImpl<$Res, _$SlotImpl>
    implements _$$SlotImplCopyWith<$Res> {
  __$$SlotImplCopyWithImpl(_$SlotImpl _value, $Res Function(_$SlotImpl) _then)
    : super(_value, _then);

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? status = null,
    Object? reason = freezed,
  }) {
    return _then(
      _$SlotImpl(
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        end: null == end
            ? _value.end
            : end // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SlotStatus,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as SlotDisabledReason?,
      ),
    );
  }
}

/// @nodoc

class _$SlotImpl extends _Slot {
  const _$SlotImpl({
    required this.start,
    required this.end,
    required this.status,
    this.reason,
  }) : super._();

  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final SlotStatus status;
  @override
  final SlotDisabledReason? reason;

  @override
  String toString() {
    return 'Slot(start: $start, end: $end, status: $status, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlotImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end, status, reason);

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlotImplCopyWith<_$SlotImpl> get copyWith =>
      __$$SlotImplCopyWithImpl<_$SlotImpl>(this, _$identity);
}

abstract class _Slot extends Slot {
  const factory _Slot({
    required final DateTime start,
    required final DateTime end,
    required final SlotStatus status,
    final SlotDisabledReason? reason,
  }) = _$SlotImpl;
  const _Slot._() : super._();

  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  SlotStatus get status;
  @override
  SlotDisabledReason? get reason;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlotImplCopyWith<_$SlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
