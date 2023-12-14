/*External dependencies */
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Продукты', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: ListView.builder(
          itemCount: (items.length / 2).ceil(),
          itemBuilder: (context, rowIndex) {
            final startIndex = rowIndex * 2;
            final endIndex = startIndex + 2;
            final rowItems =
                items.sublist(startIndex, endIndex.clamp(0, items.length));
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(item.image),
                              Text(
                                item.name,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                '${item.price} с',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
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
    );
  }
}
