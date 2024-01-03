import 'package:bloc/bloc.dart';
import 'package:ecomarket/repository/models/category.dart';
import 'package:ecomarket/repository/models/product.dart';
import 'package:ecomarket/repository/service/product_service.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiService _service;

  CategoryBloc(this._service) : super(CategoryLoadingState()) {
    on<LoadCategoriesEvent>((event, emit) async {
      final categories = await _service.getCategories();
      emit(CategoryLoadingState());
      try {
        emit(CategoryLoadedState(categories));
        print('the {$categories.name} was loaded');
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
    on<SelectCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      final productList =
          await _service.getProductsByCategory(event.categoryName);
      try {
        print('the ${productList} of ${event.categoryName} was tapped');
        emit(ProductListLoadedState(productList));
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
  }
}
