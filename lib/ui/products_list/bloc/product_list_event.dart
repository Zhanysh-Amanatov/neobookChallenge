part of 'product_list_bloc.dart';

sealed class ProductListScreenEvent extends Equatable {
  const ProductListScreenEvent();
}

class LoadProductListScreenEvent extends ProductListScreenEvent {
  const LoadProductListScreenEvent(this.categoryName);

  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}
