import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              // '${snapshot.data![index].image}',
              width: 160.w,
              height: 100.h,
            ),
            Text(
              title,
              // '${snapshot.data![index].title}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20.h),
            Text(price,
                // '${snapshot.data![index].price} с',
                style: Theme.of(context).textTheme.displayMedium),
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
    );
  }
}
