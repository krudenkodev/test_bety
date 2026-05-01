// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookingData _$BookingDataFromJson(Map<String, dynamic> json) {
  return _BookingData.fromJson(json);
}

/// @nodoc
mixin _$BookingData {
  WorkingHours get workingHours => throw _privateConstructorUsedError;
  int get bufferMinutes => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;
  List<Appointment> get appointments => throw _privateConstructorUsedError;

  /// Serializes this BookingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDataCopyWith<BookingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDataCopyWith<$Res> {
  factory $BookingDataCopyWith(
    BookingData value,
    $Res Function(BookingData) then,
  ) = _$BookingDataCopyWithImpl<$Res, BookingData>;
  @useResult
  $Res call({
    WorkingHours workingHours,
    int bufferMinutes,
    List<Service> services,
    List<Appointment> appointments,
  });

  $WorkingHoursCopyWith<$Res> get workingHours;
}

/// @nodoc
class _$BookingDataCopyWithImpl<$Res, $Val extends BookingData>
    implements $BookingDataCopyWith<$Res> {
  _$BookingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workingHours = null,
    Object? bufferMinutes = null,
    Object? services = null,
    Object? appointments = null,
  }) {
    return _then(
      _value.copyWith(
            workingHours: null == workingHours
                ? _value.workingHours
                : workingHours // ignore: cast_nullable_to_non_nullable
                      as WorkingHours,
            bufferMinutes: null == bufferMinutes
                ? _value.bufferMinutes
                : bufferMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            services: null == services
                ? _value.services
                : services // ignore: cast_nullable_to_non_nullable
                      as List<Service>,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<Appointment>,
          )
          as $Val,
    );
  }

  /// Create a copy of BookingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkingHoursCopyWith<$Res> get workingHours {
    return $WorkingHoursCopyWith<$Res>(_value.workingHours, (value) {
      return _then(_value.copyWith(workingHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingDataImplCopyWith<$Res>
    implements $BookingDataCopyWith<$Res> {
  factory _$$BookingDataImplCopyWith(
    _$BookingDataImpl value,
    $Res Function(_$BookingDataImpl) then,
  ) = __$$BookingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    WorkingHours workingHours,
    int bufferMinutes,
    List<Service> services,
    List<Appointment> appointments,
  });

  @override
  $WorkingHoursCopyWith<$Res> get workingHours;
}

/// @nodoc
class __$$BookingDataImplCopyWithImpl<$Res>
    extends _$BookingDataCopyWithImpl<$Res, _$BookingDataImpl>
    implements _$$BookingDataImplCopyWith<$Res> {
  __$$BookingDataImplCopyWithImpl(
    _$BookingDataImpl _value,
    $Res Function(_$BookingDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workingHours = null,
    Object? bufferMinutes = null,
    Object? services = null,
    Object? appointments = null,
  }) {
    return _then(
      _$BookingDataImpl(
        workingHours: null == workingHours
            ? _value.workingHours
            : workingHours // ignore: cast_nullable_to_non_nullable
                  as WorkingHours,
        bufferMinutes: null == bufferMinutes
            ? _value.bufferMinutes
            : bufferMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        services: null == services
            ? _value._services
            : services // ignore: cast_nullable_to_non_nullable
                  as List<Service>,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<Appointment>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDataImpl implements _BookingData {
  const _$BookingDataImpl({
    required this.workingHours,
    required this.bufferMinutes,
    required final List<Service> services,
    required final List<Appointment> appointments,
  }) : _services = services,
       _appointments = appointments;

  factory _$BookingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDataImplFromJson(json);

  @override
  final WorkingHours workingHours;
  @override
  final int bufferMinutes;
  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<Appointment> _appointments;
  @override
  List<Appointment> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  String toString() {
    return 'BookingData(workingHours: $workingHours, bufferMinutes: $bufferMinutes, services: $services, appointments: $appointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDataImpl &&
            (identical(other.workingHours, workingHours) ||
                other.workingHours == workingHours) &&
            (identical(other.bufferMinutes, bufferMinutes) ||
                other.bufferMinutes == bufferMinutes) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    workingHours,
    bufferMinutes,
    const DeepCollectionEquality().hash(_services),
    const DeepCollectionEquality().hash(_appointments),
  );

  /// Create a copy of BookingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDataImplCopyWith<_$BookingDataImpl> get copyWith =>
      __$$BookingDataImplCopyWithImpl<_$BookingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDataImplToJson(this);
  }
}

abstract class _BookingData implements BookingData {
  const factory _BookingData({
    required final WorkingHours workingHours,
    required final int bufferMinutes,
    required final List<Service> services,
    required final List<Appointment> appointments,
  }) = _$BookingDataImpl;

  factory _BookingData.fromJson(Map<String, dynamic> json) =
      _$BookingDataImpl.fromJson;

  @override
  WorkingHours get workingHours;
  @override
  int get bufferMinutes;
  @override
  List<Service> get services;
  @override
  List<Appointment> get appointments;

  /// Create a copy of BookingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDataImplCopyWith<_$BookingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
