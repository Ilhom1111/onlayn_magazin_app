import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/carts_model/cart_model.dart';
import '../../../services/networcin_service.dart';

part 'users_carts_event.dart';
part 'users_carts_state.dart';

class UsersCartsBloc extends Bloc<UsersCartsEvent, UsersCartsState> {
  UsersCartsBloc() : super(UsersCartsInitial()) {
    on<UsersCartsParsEvent>(_parseUsersCarts);
  }

  void _parseUsersCarts(UsersCartsParsEvent event, Emitter emit) async {
    emit(UsersCartsLoading());
    final data = await Networc.cartsGet();
    if (data != null) {
      List<CartModel> usersCarts = Networc.parseCarts(data);
      emit(CreateUsersCartsSuccess(usersCarts));
    } else {
      emit(const UsersCartsFailure(
          "Please check the internet. Could not connect to the network!"));
    }
  }
}
