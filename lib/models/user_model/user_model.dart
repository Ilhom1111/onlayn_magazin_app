import 'package:freezed_annotation/freezed_annotation.dart';

import 'address/address_model.dart';
import 'name/name_model.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required Address address,
    required int id,
    required String email,
    required String username,
    required String password,
    required Name name,
    required String phone,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
