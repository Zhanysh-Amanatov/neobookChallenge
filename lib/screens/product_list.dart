/*External dependencies */
import 'dart:convert';

import 'package:ecomarket/screens/product_details.dart';
import 'package:ecomarket/screens/segment_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class Product {
  int? id;
  String? title;
  String? description;
  dynamic category;
  String? image;
  int? quantity;
  String? price;
  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.image,
    this.quantity,
    this.price,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: (json['category']),
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}

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

    String categoryName = args?['categoryId'] ?? 0;

    Future<List<Product>> getProducts(String categoryName) async {
      String url = 'https://neobook.online/ecobak/product-list';
      final response = await http.get(Uri.parse(url));
      // var responseData = json.decode(utf8.decode(response.bodyBytes));

      try {
        // final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          List<dynamic> data = json.decode(response.body);
          if (data.isNotEmpty && data[0] is List) {
            List<Product> products = (data[0] as List)
                .map((json) => Product.fromJson(json))
                // .where((product) => product.category == categoryName)
                .toList();

            return products;
          } else {
            throw Exception('Invalid API response format');
          }
        } else {
          throw Exception('Failed to load products');
        }
      } catch (error) {
        throw Exception('Error: $error');
      }

      //   List<Product> categories = [];
      //   if (response.statusCode == 200) {
      //   for (var singleProduct in responseData) {
      //     Product product = Product(
      //       id: singleProduct['id'],
      //       title: singleProduct['title'],
      //       description: singleProduct['description'],
      //       category: singleProduct['category'],
      //       image: singleProduct['image'],
      //       quantity: singleProduct['quantity'],
      //       price: singleProduct['price'],
      //     );

      //     categories.add(product);
      //   }
      //     } else {
      //       throw Exception('Failed to load data');
      //     }
      //     return categories;
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Продукты', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: FutureBuilder(
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
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const ProductDetailsBottomSheet();
                          },
                          isScrollControlled: true);
                    },
                    child: Card(
                      child: SizedBox(
                        // width: 166.w,
                        // height: 228.h,
                        child: Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '${snapshot.data![index].image}',
                                width: 160.w,
                                height: 100.h,
                              ),
                              Text(
                                '${snapshot.data![index].title}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(height: 20.h),
                              Text('${snapshot.data![index].price} с',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('Добавить'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

      // body: Stack(
      //   children: [
      //     Column(
      //       children: [
      //         SizedBox(
      //           width: 343.w,
      //           child: SearchBar(
      //             shadowColor: MaterialStateProperty.all(Colors.transparent),
      //             hintText: 'Быстрый поиск',
      //             hintStyle: MaterialStateProperty.all(
      //                 Theme.of(context).textTheme.displaySmall),
      //             leading: const Icon(Icons.search, color: Color(0xFFD2D1D5)),
      //             backgroundColor:
      //                 MaterialStateProperty.all(const Color(0xFFF8F8F8)),
      //             constraints:
      //                 const BoxConstraints(maxWidth: 400, minHeight: 44),
      //             shape:
      //                 MaterialStateProperty.all(const ContinuousRectangleBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(36)),
      //             )),
      //           ),
      //         ),
      //         SegmentControlWidget(
      //           values: [
      //             'all',
      //             'header1',
      //             'header2',
      //             'header3',
      //             'header4',
      //           ],
      //           onSelected: (index) {
      //             print('selected $index');
      //           },
      //         ),
      //         Expanded(
      //           child: ListView.builder(
      //               itemCount: (items.length / 2).ceil(),
      //               itemBuilder: (context, rowIndex) {
      //                 final startIndex = rowIndex * 2;
      //                 final endIndex = startIndex + 2;
      //                 final rowItems = items.sublist(
      //                     startIndex, endIndex.clamp(0, items.length));
      //                 return GestureDetector(
      //                   onTap: () {
      //                     showModalBottomSheet(
      //                         context: context,
      //                         builder: (BuildContext context) {
      //                           return ProductDetailsBottomSheet();
      //                         },
      //                         isScrollControlled: true);
      //                   },
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       for (final item in rowItems)
      //                         Card(
      //                           child: SizedBox(
      //                             width: 166.w,
      //                             // height: 228.h,
      //                             child: Padding(
      //                               padding: EdgeInsets.all(4.w),
      //                               child: Column(
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.start,
      //                                 children: [
      //                                   Image.asset(
      //                                     item.image,
      //                                     width: 160.w,
      //                                     height: 100.h,
      //                                   ),
      //                                   Text(
      //                                     item.name,
      //                                     style: Theme.of(context)
      //                                         .textTheme
      //                                         .headlineSmall,
      //                                   ),
      //                                   SizedBox(height: 20.h),
      //                                   Text('${item.price} с',
      //                                       style: Theme.of(context)
      //                                           .textTheme
      //                                           .displayMedium),
      //                                   SizedBox(height: 20.h),
      //                                   SizedBox(
      //                                     width: double.infinity,
      //                                     child: TextButton(
      //                                       onPressed: () {},
      //                                       child: const Text('Добавить'),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       if (rowItems.length % 2 == 1)
      //                         SizedBox(
      //                           width: 166.w,
      //                           child: const Card(
      //                             color: Colors.transparent,
      //                           ),
      //                         ),
      //                     ],
      //                   ),
      //                 );
      //               }),
      //         ),
      //       ],
      //     ),
      //     Positioned(
      //         bottom: 50.h,
      //         right: 16.w,
      //         child: SizedBox(
      //           width: 170.w,
      //           height: 50.h,
      //           child: TextButton.icon(
      //             icon: const Icon(Icons.badge),
      //             onPressed: () {},
      //             label: const Text('Корзина'),
      //           ),
      //         ))
      //   ],
      // ),