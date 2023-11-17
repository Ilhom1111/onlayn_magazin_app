import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/products_model/products_model.dart';
import '../../services/networcin_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsParsEvent>(_parseProducts);
  }

  void _parseProducts(ProductsParsEvent event, Emitter emit) async {
    emit(ProductsLoading());
    final data = await Networc.productsGet();
    if (data != null) {
      List<ProductsModel> products = Networc.parseProducts(data);
      emit(CreateProductsSuccess(products));
    } else {
      emit(const ProductsFailure(
          "Please check the internet. Could not connect to the network!"));
    }
  }
}
