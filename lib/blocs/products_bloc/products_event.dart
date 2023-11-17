part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductsParsEvent extends ProductsEvent {
  const ProductsParsEvent();

  @override
  List<Object?> get props => [];
}
