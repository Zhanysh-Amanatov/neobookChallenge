// import 'package:bloc/bloc.dart';
// import 'package:ecomarket/screens/data.dart';
// import 'package:meta/meta.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   // final Service productService = Service();

//   ProductBloc() : super(ProductLoading()) {
//     on<FetchProducts>((event, emit) async {
//       emit(ProductLoading());
//       try {
//         final products = await productService.getCategories();
//         emit(ProductLoaded(products));
//       } catch (error) {
//         emit(ProductError('Failed to fetch categories'));
//       }
//     });
//   }
// }
