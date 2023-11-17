import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlayn_magazin_app/models/user_model/user_model.dart';

import '../../services/networcin_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersParsEvent>(_parseUsers);
  }

  void _parseUsers(UsersParsEvent event, Emitter emit) async {
    emit(UsersLoading());
    final data = await Networc.usersGet();
    if (data != null) {
      List<UserModel> users = Networc.parseUsers(data);
      emit(CreateUsersSuccess(users));
    } else {
      emit(const UsersFailure(
          "Please check the internet. Could not connect to the network!"));
    }
  }
}
