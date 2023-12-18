/*External dependencies */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
/*Local dependencies */
import 'data.dart';

class SegmentControlWidget extends StatefulWidget {
  // final List<String> values;
  final int initialPosition;
  // final Function(int index) onSelected;

  const SegmentControlWidget({
    super.key,
    // required this.values,
    // required this.onSelected,
    this.initialPosition = 0,
  });

  @override
  State<SegmentControlWidget> createState() => _SegmentControlWidgetState();
}

class _SegmentControlWidgetState extends State<SegmentControlWidget> {
  late int current;
  late List<String> productCategories;
  List<dynamic> displayedProducts = [];
  @override
  void initState() {
    super.initState();
    current = widget.initialPosition;
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
    return productCategories.isEmpty
        ? Container()
        : Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(productCategories.length, (index) {
                    return GestureDetector(
                      onTap: () async {
                        print('Segment tapped');
                        setState(() {
                          current = index;
                        });

                        if (productCategories[index] == 'Все') {
                          await fetchProductCategories();
                        } else {
                          await getProducts(productCategories[index]);
                        }
                      },
                      child: Container(
                        height: 35.h,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 4.h),
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Theme.of(context).hintColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: index == current
                                ? Theme.of(context).primaryColor
                                : Colors.white),
                        child: Text(productCategories[index],
                            style: index == current
                                ? Theme.of(context).textTheme.bodySmall
                                : Theme.of(context).textTheme.displaySmall
                            // style:  const TextStyle(colo Theme.of(context).hintColor),
                            ),
                      ),
                    );
                  })),
            ),
          );
  }
}
