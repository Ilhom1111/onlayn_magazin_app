import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginMadel with _$LoginMadel {
  const factory LoginMadel({required String token}) = _LoginMadel;

  factory LoginMadel.fromJson(Map<String, dynamic> json) =>
      _$LoginMadelFromJson(json);
}
