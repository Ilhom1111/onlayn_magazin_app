part of 'users_carts_bloc.dart';

abstract class UsersCartsState extends Equatable {
  const UsersCartsState();
}

class UsersCartsLoading extends UsersCartsState {
  @override
  List<Object> get props => [];
}

class UsersCartsInitial extends UsersCartsState {
  @override
  List<Object> get props => [];
}

class UsersCartsFailure extends UsersCartsState {
  final String message;

  const UsersCartsFailure(this.message);
  @override
  List<Object> get props => [message];
}

class CreateUsersCartsSuccess extends UsersCartsState {
  final List<CartModel> usersCarts;
  const CreateUsersCartsSuccess(this.usersCarts);
  @override
  List<Object> get props => [usersCarts];
}
