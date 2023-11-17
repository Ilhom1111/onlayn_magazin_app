import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/networcin_service.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesParsEvent>(_parseCategories);
  }

  void _parseCategories(CategoriesParsEvent event, Emitter emit) async {
    emit(CategoriesLoading());
    final data = await Networc.categoriesGet();
    if (data != null) {
      List<String> categories = Networc.parseCategories(data);
      emit(CreateCategoriesSuccess(categories));
    } else {
      emit(const CategoriesFailure(
          "Please check the internet. Could not connect to the network!"));
    }
  }
}
