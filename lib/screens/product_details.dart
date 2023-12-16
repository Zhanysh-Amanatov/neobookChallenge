import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize:
          0.6.h, // Initial height of the bottom sheet (half the screen)
      minChildSize: 0.2, // Minimum height of the bottom sheet
      maxChildSize: 0.9, // Maximum height of the bottom sheet
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: ListView(
              controller: scrollController,
              children: [
                Image.asset(
                  'assets/images/orange.png',
                  height: 200.h,
                  width: double.infinity,
                ),
                ListTile(
                  title: Text('Апельсины сладкий пакистанский',
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                ListTile(
                    title: Text('86 с шт',
                        style: Theme.of(context).textTheme.displayMedium)),
                ListTile(
                  title: Text(
                    'Cочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 54.h,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Добавить'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
