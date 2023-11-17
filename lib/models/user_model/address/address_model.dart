import 'package:freezed_annotation/freezed_annotation.dart';

import '../geolocation/geolocation_model.dart';
part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required Geolocation geolocation,
    required String city,
    required String street,
    required int number,
    required String zipcode,
  }) = _Aaddress;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
