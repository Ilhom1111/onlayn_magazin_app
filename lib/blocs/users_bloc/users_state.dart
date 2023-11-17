part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersLoading extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersFailure extends UsersState {
  final String message;

  const UsersFailure(this.message);
  @override
  List<Object> get props => [message];
}

class CreateUsersSuccess extends UsersState {
  final List<UserModel> users;
  const CreateUsersSuccess(this.users);
  @override
  List<Object> get props => [users];
}
