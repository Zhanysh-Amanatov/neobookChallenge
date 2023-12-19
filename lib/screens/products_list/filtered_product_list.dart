// // ignore_for_file: avoid_print
// ignore_for_file: avoid_print

/*External dependencies */
import 'package:ecomarket/screens/products_list/product_card.dart';
import 'package:flutter/material.dart';
/*Local dependencies */
import 'package:ecomarket/screens/data.dart';
import 'package:ecomarket/screens/product_details_screen.dart';

class FilteredProductList extends StatelessWidget {
  const FilteredProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String categoryName = args?['categoryName'] ?? 0;
    print('Recieved Category Name: $categoryName');
    return FutureBuilder(
      future: getProducts(categoryName),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No categories found'),
          );
        } else {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: SingleChildScrollView(
                    child: ProductCard(
                      image: '${snapshot.data![index].image}',
                      title: '${snapshot.data![index].title}',
                      price: '${snapshot.data![index].price}',
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const ProductDetailsBottomSheet();
                        },
                        isScrollControlled: true);
                  },
                );
              });
        }
      },
    );
  }
}