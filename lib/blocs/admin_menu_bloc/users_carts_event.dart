part of 'users_carts_bloc.dart';

abstract class UsersCartsEvent extends Equatable {
  const UsersCartsEvent();
}

class UsersCartsParsEvent extends UsersCartsEvent {
  const UsersCartsParsEvent();

  @override
  List<Object?> get props => [];
}
