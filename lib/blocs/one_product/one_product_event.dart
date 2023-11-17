part of 'one_product_bloc.dart';

abstract class OneProductEvent extends Equatable {
  const OneProductEvent();
}

class OneProductParsEvent extends OneProductEvent {
  final int id;
  const OneProductParsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
