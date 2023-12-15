/*External dependencies */
import 'package:ecomarket/screens/segment_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product {
  String image;
  String name;
  String price;
  Product(this.image, this.name, this.price);
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> items = [
    Product('assets/images/orange.png', 'Апельсины сладкий пакистанский', '86'),
    Product('assets/images/orange.png', 'Апельсины сладкий пакистанский', '86'),
    Product('assets/images/orange.png', 'Апельсины сладкий пакистанский', '86'),
    Product('assets/images/orange.png', 'Апельсины сладкий пакистанский', '86'),
    Product('assets/images/orange.png', 'Апельсины сладкий пакистанский', '86'),
    Product('assets/images/orange.png', 'Апельсины сладкий пакистанский', '86'),
  ];
  @override
  Widget build(BuildContext context) {
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
              SegmentControlWidget(
                  values: [
                    'all',
                    'header1',
                    'header2',
                    'header3',
                    'header4',
                  ],
                  onSelected: (index) {
                    print('selected $index');
                  }),
              Expanded(
                child: ListView.builder(
                    itemCount: (items.length / 2).ceil(),
                    itemBuilder: (context, rowIndex) {
                      final startIndex = rowIndex * 2;
                      final endIndex = startIndex + 2;
                      final rowItems = items.sublist(
                          startIndex, endIndex.clamp(0, items.length));
                      return GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final item in rowItems)
                              Card(
                                child: SizedBox(
                                  width: 166.w,
                                  // height: 228.h,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(item.image),
                                        Text(
                                          item.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          '${item.price} с',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
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
                            if (rowItems.length % 2 == 1)
                              SizedBox(
                                width: 166.w,
                                child: const Card(
                                  color: Colors.transparent,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
              ),
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
              ))
        ],
      ),
    );
  }
}
