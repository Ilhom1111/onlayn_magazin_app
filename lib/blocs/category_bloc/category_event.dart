part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryParsEvent extends CategoryEvent {
  final String category;
  const CategoryParsEvent(this.category);

  @override
  List<Object?> get props => [category];
}
