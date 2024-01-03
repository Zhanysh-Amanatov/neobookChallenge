/*External dependencies */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
/*Local dependencies */
import 'package:ecomarket/ui/home/bloc/category_bloc.dart';
import 'package:ecomarket/ui/products_list/bloc/product_list_bloc.dart';
import 'package:ecomarket/repository/models/product.dart';
import 'package:ecomarket/ui/product/product_details_screen.dart';
import 'package:ecomarket/ui/products_list/product_card.dart';

class FilteredProductListScreen extends StatelessWidget {
  const FilteredProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is ProductListScreenLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductListLoadedState) {
            List<Product> productList = state.productList;
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 16 / 22,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ProductCard(
                      image: '${productList[index].image}',
                      title: '${productList[index].title}',
                      price: '${productList[index].price}',
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ProductDetailsBottomSheet(
                              image: '${productList[index].image}',
                              title: '${productList[index].title}',
                              price: '${productList[index].price}',
                              description: '${productList[index].description}',
                            );
                          },
                          isScrollControlled: true);
                    },
                  );
                });
          }
          return Container();
        },
      ),
    );

// old version
    // final Map<String, dynamic>? args =
    // ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // String categoryName = args?['categoryName'] ?? 0;
    // return FutureBuilder(
    //   future: ApiService().getProductsByCategory(categoryName),
    //   builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Text('Error: ${snapshot.error}'),
    //       );
    //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //       return const Center(
    //         child: Text('No categories found'),
    //       );
    //     } else {
    //       return GridView.builder(
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             crossAxisSpacing: 16.0,
    //             mainAxisSpacing: 16.0,
    //             childAspectRatio: 16 / 22,
    //           ),
    //           itemCount: snapshot.data!.length,
    //           itemBuilder: (context, index) {
    //             return GestureDetector(
    //               child: ProductCard(
    //                 image: '${snapshot.data![index].image}',
    //                 title: '${snapshot.data![index].title}',
    //                 price: '${snapshot.data![index].price}',
    //               ),
    //               onTap: () {
    //                 showModalBottomSheet(
    //                     context: context,
    //                     builder: (BuildContext context) {
    //                       return ProductDetailsBottomSheet(
    //                         image: '${snapshot.data![index].image}',
    //                         title: '${snapshot.data![index].title}',
    //                         price: '${snapshot.data![index].price}',
    //                         description: '${snapshot.data![index].description}',
    //                       );
    //                     },
    //                     isScrollControlled: true);
    //               },
    //             );
    //           });
    //     }
    //   },
    // );
  }
}
