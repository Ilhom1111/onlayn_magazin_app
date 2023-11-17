part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class CategoriesParsEvent extends CategoriesEvent {
  const CategoriesParsEvent();

  @override
  List<Object?> get props => [];
}
