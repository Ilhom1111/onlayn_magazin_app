import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/products_model/products_model.dart';
import '../../services/networcin_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryParsEvent>(_parseOneProduct);
  }

  void _parseOneProduct(CategoryParsEvent event, Emitter emit) async {
    emit(CategoryLoading());
    final data = await Networc.categoryGet(category: event.category);
    if (data != null) {
      List<ProductsModel> product = Networc.parseProducts(data);
      emit(CreateCategorySuccess(product));
    } else {
      emit(const CategoryFailure(
          "Please check the internet. Could not connect to the network!"));
    }
  }
}
