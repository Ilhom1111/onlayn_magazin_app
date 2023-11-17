// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsCart _$ProductsCartFromJson(Map<String, dynamic> json) {
  return _ProductsCart.fromJson(json);
}

/// @nodoc
mixin _$ProductsCart {
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsCartCopyWith<ProductsCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsCartCopyWith<$Res> {
  factory $ProductsCartCopyWith(
          ProductsCart value, $Res Function(ProductsCart) then) =
      _$ProductsCartCopyWithImpl<$Res, ProductsCart>;
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class _$ProductsCartCopyWithImpl<$Res, $Val extends ProductsCart>
    implements $ProductsCartCopyWith<$Res> {
  _$ProductsCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsCartImplCopyWith<$Res>
    implements $ProductsCartCopyWith<$Res> {
  factory _$$ProductsCartImplCopyWith(
          _$ProductsCartImpl value, $Res Function(_$ProductsCartImpl) then) =
      __$$ProductsCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class __$$ProductsCartImplCopyWithImpl<$Res>
    extends _$ProductsCartCopyWithImpl<$Res, _$ProductsCartImpl>
    implements _$$ProductsCartImplCopyWith<$Res> {
  __$$ProductsCartImplCopyWithImpl(
      _$ProductsCartImpl _value, $Res Function(_$ProductsCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$ProductsCartImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsCartImpl implements _ProductsCart {
  const _$ProductsCartImpl({required this.productId, required this.quantity});

  factory _$ProductsCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsCartImplFromJson(json);

  @override
  final int productId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ProductsCart(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsCartImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsCartImplCopyWith<_$ProductsCartImpl> get copyWith =>
      __$$ProductsCartImplCopyWithImpl<_$ProductsCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsCartImplToJson(
      this,
    );
  }
}

abstract class _ProductsCart implements ProductsCart {
  const factory _ProductsCart(
      {required final int productId,
      required final int quantity}) = _$ProductsCartImpl;

  factory _ProductsCart.fromJson(Map<String, dynamic> json) =
      _$ProductsCartImpl.fromJson;

  @override
  int get productId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ProductsCartImplCopyWith<_$ProductsCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
