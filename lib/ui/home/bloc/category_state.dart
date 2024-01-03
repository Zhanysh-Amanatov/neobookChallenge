part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState();

  @override
  List<Object?> get props => [];
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(this.categories);

  final List<Category> categories;
  @override
  List<Object?> get props => [categories];
}

class ProductListLoadedState extends CategoryState {
  ProductListLoadedState(this.productList);

  final List<Product> productList;
  @override
  List<Object?> get props => [productList];
}

class CategoryErrorState extends CategoryState {
  CategoryErrorState(this.error);

  final String error;
  @override
  List<Object?> get props => [error];
}


// enum CategoryStatus { initial, success, error, loading, selected }

// extension CategoryStatusX on CategoryStatus {
//   bool get isInitial => this == CategoryStatus.initial;
//   bool get isSuccess => this == CategoryStatus.success;
//   bool get isError => this == CategoryStatus.error;
//   bool get isLoading => this == CategoryStatus.loading;
//   bool get isSelected => this == CategoryStatus.selected;
// }

// class CategoryState extends Equatable {
//   const CategoryState(
//       {this.status = CategoryStatus.initial,
//       List<Category>? categories,
//       int idSelected = 0})
//       : categories = categories ?? const [],
//         idSelected = idSelected;

//   final List<Category> categories;
//   final CategoryStatus status;
//   final int idSelected;

//   @override
//   List<Object?> get props => [status, categories, idSelected];

//   CategoryState copyWith({
//     List<Category>? categories,
//     CategoryStatus? status,
//     int? idSelected,
//   }) {
//     return CategoryState(
//         categories: categories ?? this.categories,
//         status: status ?? this.status,
//         idSelected: idSelected ?? this.idSelected);
//   }
// }

// enum CategoryStatus { initial, success, failure }

// final class CategoryState extends Equatable {
//   final CategoryStatus status;
//   final List<Category> categories;
//   final bool hasReachedMax;
//   const CategoryState({
//     this.status = CategoryStatus.initial,
//     this.categories = const <Category>[],
//     this.hasReachedMax = false,
//   });

//   CategoryState copyWith({
//     CategoryStatus? status,
//     List<Category>? categories,
//     bool? hasReachedMax
//   }){
//     return CategoryState(
//       status: status ?? this.status,
//       categories: categories ?? this.categories,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax
//     );
//   }

//   @override
//   String toString(){
//     return '''CategoryState { status: $status, hasReachedMax: $hasReachedMax, posts: ${categories.length} }''';
//   }

//   @override
//   List<Object> get props => [status,categories,hasReachedMax];
// }

// final class CategoryInitial extends CategoryState {}
