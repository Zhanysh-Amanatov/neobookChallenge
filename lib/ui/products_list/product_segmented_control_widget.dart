// ignore_for_file: avoid_print

/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/repository/models/category.dart';
import 'package:ecomarket/repository/service/product_service.dart';
import 'package:ecomarket/ui/home/bloc/category_bloc.dart';

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
  Category? current;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiService(),
      child: BlocProvider(
        create: (context) =>
            CategoryBloc(RepositoryProvider.of<ApiService>(context))
              ..add(LoadCategoriesEvent()),
        child: Scaffold(
          body: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoadedState) {
                List<Category> categoryList = state.categories;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            current = categoryList[index];
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 5.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).hintColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: current == categoryList[index]
                                  ? Theme.of(context).primaryColor
                                  : Colors.white),
                          child: Text('${categoryList[index].name}',
                              style: current == categoryList[index]
                                  ? Theme.of(context).textTheme.bodySmall
                                  : Theme.of(context).textTheme.displaySmall),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is CategoryErrorState) {
                return const Center(
                  child: Text('Error occured'),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

    // return FutureBuilder(
    //     future: getProducts(categoryName),
    //     builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    //       if (snapshot.connectionState == ConnectionState.none) {
    //         return Container(height: 30.h);
    //       } else {
    //         return SizedBox(
    //           height: 30.h,
    //           child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: ProductCategoriesScreen.length,
    //             itemBuilder: (context, index) {
    //               return GestureDetector(
    //                 onTap: () async {
    //                   setState(() {
    //                     current = ProductCategoriesScreen[index];
    //                   });
    //                 },
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   margin: EdgeInsets.symmetric(horizontal: 5.h),
    //                   padding: EdgeInsets.symmetric(horizontal: 15.w),
    //                   decoration: BoxDecoration(
    //                       border:
    //                           Border.all(color: Theme.of(context).hintColor),
    //                       borderRadius:
    //                           const BorderRadius.all(Radius.circular(20)),
    //                       color: current == ProductCategoriesScreen[index]
    //                           ? Theme.of(context).primaryColor
    //                           : Colors.white),
    //                   child: Text(ProductCategoriesScreen[index],
    //                       style: current == ProductCategoriesScreen[index]
    //                           ? Theme.of(context).textTheme.bodySmall
    //                           : Theme.of(context).textTheme.displaySmall),
    //                 ),
    //               );
    //             },
    //           ),
    //         );
    //       }
    //     });