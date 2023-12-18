// ignore_for_file: avoid_print
/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/screens/data.dart';
import 'package:ecomarket/screens/product_details.dart';

class FilteredList extends StatelessWidget {
  const FilteredList({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String categoryName = args?['categoryName'] ?? 0;
    print('Recieved Category Name: $categoryName');
    return FutureBuilder(
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
                  child: SingleChildScrollView(
                    child: Card(
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(height: 20.h),
                            Text('${snapshot.data![index].price} с',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
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
    );
  }
}
