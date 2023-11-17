part of 'one_product_bloc.dart';

abstract class OneProductState extends Equatable {
  const OneProductState();
}

class OneProductLoading extends OneProductState {
  @override
  List<Object> get props => [];
}

class OneProductInitial extends OneProductState {
  @override
  List<Object> get props => [];
}

class OneProductFailure extends OneProductState {
  final String message;

  const OneProductFailure(this.message);
  @override
  List<Object> get props => [message];
}

class CreateOneProductSuccess extends OneProductState {
  final ProductsModel product;
  const CreateOneProductSuccess(this.product);
  @override
  List<Object> get props => [product];
}
