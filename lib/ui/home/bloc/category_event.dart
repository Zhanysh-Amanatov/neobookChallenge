part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadCategoriesEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class SelectCategoryEvent extends CategoryEvent {
  const SelectCategoryEvent(this.categoryName);

  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}

// class GetCategoriesEvent extends CategoryEvent {}

// class SelectCategory extends CategoryEvent {
//   const SelectCategory({required this.idSelected});

//   final int idSelected;

//   @override
//   List<Object?> get props => [idSelected];
// }

// final class CategoryFetched extends CategoryEvent {}
