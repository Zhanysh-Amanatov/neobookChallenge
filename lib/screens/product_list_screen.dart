// // ignore_for_file: avoid_print

/*External dependencies */
import 'package:ecomarket/screens/products_list/product_search_bar_widget.dart';
import 'package:ecomarket/screens/products_list/product_segmented_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/screens/products_list/filtered_product_list_widget.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String categoryName = args?['categoryName'] ?? 0;
    // print('Recieved Category Name: $categoryName');

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Продукты', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const ProductSearchBarWidget(),
                SizedBox(height: 20.h),
                const ProductSegmentedControlWidget(),
                SizedBox(height: 20.h),
                const Expanded(child: FilteredProductList())
              ],
            ),
          ),
          Positioned(
            bottom: 50.h,
            right: 16.w,
            child: SizedBox(
              width: 170.w,
              height: 50.h,
              child: TextButton.icon(
                icon: const Icon(Icons.badge),
                onPressed: () {},
                label: const Text('Корзина'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
