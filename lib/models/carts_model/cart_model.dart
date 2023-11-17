import 'package:freezed_annotation/freezed_annotation.dart';

import 'products/products.dart';
part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required int id,
    required int userId,
    required String date,
    required List<ProductsCart> products,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, Object?> json) =>
      _$CartModelFromJson(json);
}
