part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class UsersParsEvent extends UsersEvent {
  const UsersParsEvent();

  @override
  List<Object?> get props => [];
}
