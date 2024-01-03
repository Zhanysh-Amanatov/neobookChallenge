part of 'product_list_bloc.dart';

abstract class ProductListScreenState extends Equatable {}

class ProductListScreenLoadingState extends ProductListScreenState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ProductListScreenLoadedState extends ProductListScreenState {
  ProductListScreenLoadedState(this.productsList);

  final List<Product> productsList;
  @override
  List<Object?> get props => [productsList];
}

class ProductListScreenErrorState extends ProductListScreenState {
  ProductListScreenErrorState(this.error);

  final String error;
  @override
  List<Object?> get props => [error];
}
