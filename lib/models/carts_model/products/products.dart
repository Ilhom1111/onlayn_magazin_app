import 'package:freezed_annotation/freezed_annotation.dart';
part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class ProductsCart with _$ProductsCart {
  const factory ProductsCart({
    required int productId,
    required int quantity,
  }) = _ProductsCart;

  factory ProductsCart.fromJson(Map<String, Object?> json) =>
      _$ProductsCartFromJson(json);
}
