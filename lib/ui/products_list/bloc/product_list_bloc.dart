import 'package:bloc/bloc.dart';
import 'package:ecomarket/repository/models/product.dart';
import 'package:ecomarket/repository/service/product_service.dart';
import 'package:equatable/equatable.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListScreenBloc
    extends Bloc<ProductListScreenEvent, ProductListScreenState> {
  final ApiService _Service;

  ProductListScreenBloc(this._Service)
      : super(ProductListScreenLoadingState()) {
    on<ProductListScreenEvent>((event, emit) async {
      emit(ProductListScreenLoadingState());
      try {
        // final products = await _Service.getProducts(event.categoryName);
        // emit(ProductListScreenLoadedState(products));
      } catch (e) {
        emit(ProductListScreenErrorState(e.toString()));
      }
    });
  }
}
