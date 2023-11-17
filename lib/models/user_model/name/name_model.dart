import 'package:freezed_annotation/freezed_annotation.dart';
part 'name_model.freezed.dart';
part 'name_model.g.dart';

@freezed
class Name with _$Name {
  const factory Name({
    required String firstname,
    required String lastname,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
