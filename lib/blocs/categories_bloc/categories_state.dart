part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesLoading extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure(this.message);
  @override
  List<Object> get props => [message];
}

class CreateCategoriesSuccess extends CategoriesState {
  final List<String> categories;
  const CreateCategoriesSuccess(this.categories);
  @override
  List<Object> get props => [categories];
}
