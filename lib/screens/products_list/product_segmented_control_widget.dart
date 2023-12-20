// // ignore_for_file: avoid_print

// ignore_for_file: avoid_print

/*External dependencies */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
/*Local dependencies */
import '../data.dart';

class ProductSegmentedControlWidget extends StatefulWidget {
  final int? initialPosition;

  const ProductSegmentedControlWidget({
    super.key,
    this.initialPosition,
  });

  @override
  State<ProductSegmentedControlWidget> createState() =>
      _ProductSegmentedControlWidgetState();
}

class _ProductSegmentedControlWidgetState
    extends State<ProductSegmentedControlWidget> {
  late String current;
  late List<String> productCategories;
  List<dynamic> displayedProducts = [];
  @override
  void initState() {
    super.initState();
    current = '';
    productCategories = [];
    fetchProductCategories();
  }

  Future<void> fetchProductCategories() async {
    String url = 'https://neobook.online/ecobak/product-category-list/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        productCategories.clear();
        productCategories.add('Все');
        productCategories.addAll(
            data.map<String>((category) => category['name'].toString()));
      });
    } else {
      throw Exception('Failed to load product categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String categoryName = args?['categoryName'] ?? 0;
    print('Recieved Category Name in segmentedControl: $current');
    return FutureBuilder(
        future: getProducts(categoryName),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Container(height: 30.h);
          } else {
            return SizedBox(
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        current = productCategories[index];
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 5.h),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).hintColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: current == productCategories[index]
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                      child: Text(productCategories[index],
                          style: current == productCategories[index]
                              ? Theme.of(context).textTheme.bodySmall
                              : Theme.of(context).textTheme.displaySmall),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
