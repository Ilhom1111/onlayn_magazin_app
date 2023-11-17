part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsFailure extends ProductsState {
  final String message;

  const ProductsFailure(this.message);
  @override
  List<Object> get props => [message];
}

class CreateProductsSuccess extends ProductsState {
  final List<ProductsModel> products;
  const CreateProductsSuccess(this.products);
  @override
  List<Object> get props => [products];
}
