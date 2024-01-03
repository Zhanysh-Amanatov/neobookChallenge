/*External dependencies */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/helpers.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 160.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            Text(
              '${removeTrailingZeros(price)} c',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
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
