part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryFailure extends CategoryState {
  final String message;

  const CategoryFailure(this.message);
  @override
  List<Object> get props => [message];
}

class CreateCategorySuccess extends CategoryState {
  final List<ProductsModel> products;
  const CreateCategorySuccess(this.products);
  @override
  List<Object> get props => [products];
}
