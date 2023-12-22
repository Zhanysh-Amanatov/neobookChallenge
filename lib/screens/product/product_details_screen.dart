/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/screens/helpers.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  final String? image;
  final String? title;
  final String? price;
  final String? description;
  const ProductDetailsBottomSheet({
    super.key,
    this.image,
    this.title,
    this.price,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6.h,
      minChildSize: 0.2,
      maxChildSize: 0.9,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '$image',
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                ListTile(
                  title: Text('$title',
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                ListTile(
                  title: Text('${removeTrailingZeros(price!)} с шт',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                ListTile(
                  title: Text(
                    '$description',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                SizedBox(height: 20.h),
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
