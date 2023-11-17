// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Aaddress.fromJson(json);
}

/// @nodoc
mixin _$Address {
  Geolocation get geolocation => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get zipcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {Geolocation geolocation,
      String city,
      String street,
      int number,
      String zipcode});

  $GeolocationCopyWith<$Res> get geolocation;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geolocation = null,
    Object? city = null,
    Object? street = null,
    Object? number = null,
    Object? zipcode = null,
  }) {
    return _then(_value.copyWith(
      geolocation: null == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeolocationCopyWith<$Res> get geolocation {
    return $GeolocationCopyWith<$Res>(_value.geolocation, (value) {
      return _then(_value.copyWith(geolocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AaddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AaddressImplCopyWith(
          _$AaddressImpl value, $Res Function(_$AaddressImpl) then) =
      __$$AaddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Geolocation geolocation,
      String city,
      String street,
      int number,
      String zipcode});

  @override
  $GeolocationCopyWith<$Res> get geolocation;
}

/// @nodoc
class __$$AaddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AaddressImpl>
    implements _$$AaddressImplCopyWith<$Res> {
  __$$AaddressImplCopyWithImpl(
      _$AaddressImpl _value, $Res Function(_$AaddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geolocation = null,
    Object? city = null,
    Object? street = null,
    Object? number = null,
    Object? zipcode = null,
  }) {
    return _then(_$AaddressImpl(
      geolocation: null == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AaddressImpl implements _Aaddress {
  const _$AaddressImpl(
      {required this.geolocation,
      required this.city,
      required this.street,
      required this.number,
      required this.zipcode});

  factory _$AaddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AaddressImplFromJson(json);

  @override
  final Geolocation geolocation;
  @override
  final String city;
  @override
  final String street;
  @override
  final int number;
  @override
  final String zipcode;

  @override
  String toString() {
    return 'Address(geolocation: $geolocation, city: $city, street: $street, number: $number, zipcode: $zipcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AaddressImpl &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, geolocation, city, street, number, zipcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AaddressImplCopyWith<_$AaddressImpl> get copyWith =>
      __$$AaddressImplCopyWithImpl<_$AaddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AaddressImplToJson(
      this,
    );
  }
}

abstract class _Aaddress implements Address {
  const factory _Aaddress(
      {required final Geolocation geolocation,
      required final String city,
      required final String street,
      required final int number,
      required final String zipcode}) = _$AaddressImpl;

  factory _Aaddress.fromJson(Map<String, dynamic> json) =
      _$AaddressImpl.fromJson;

  @override
  Geolocation get geolocation;
  @override
  String get city;
  @override
  String get street;
  @override
  int get number;
  @override
  String get zipcode;
  @override
  @JsonKey(ignore: true)
  _$$AaddressImplCopyWith<_$AaddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
