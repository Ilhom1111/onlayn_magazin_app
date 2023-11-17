import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/products_model/products_model.dart';
import '../../services/networcin_service.dart';

part 'one_product_event.dart';
part 'one_product_state.dart';

class OneProductBloc extends Bloc<OneProductEvent, OneProductState> {
  OneProductBloc() : super(OneProductInitial()) {
    on<OneProductParsEvent>(_parseOneProduct);
  }

  void _parseOneProduct(OneProductParsEvent event, Emitter emit) async {
    emit(OneProductLoading());
    final data = await Networc.oneProductGet(id: event.id);
    ProductsModel product = Networc.parseOneProduct(data!);
    emit(CreateOneProductSuccess(product));
  }
}
