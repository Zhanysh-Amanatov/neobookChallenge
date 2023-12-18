// ignore_for_file: avoid_print

/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/screens/filtered_list.dart';
import 'package:ecomarket/screens/segment_control.dart';

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
    print('Recieved Category Name: $categoryName');

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Продукты', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: 343.w,
                child: SearchBar(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  hintText: 'Быстрый поиск',
                  hintStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.displaySmall),
                  leading: const Icon(Icons.search, color: Color(0xFFD2D1D5)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFF8F8F8)),
                  constraints:
                      const BoxConstraints(maxWidth: 400, minHeight: 44),
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(36)),
                  )),
                ),
              ),
              const SegmentControlWidget(),
              const Expanded(child: FilteredList())
            ],
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
