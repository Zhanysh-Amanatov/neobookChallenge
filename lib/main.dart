/*External dependecies */
import 'package:ecomarket/repository/service/product_service.dart';
import 'package:ecomarket/ui/home/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/route/routes.dart';
import 'package:ecomarket/theme.dart';
import 'package:ecomarket/ui/cart/cart_screen.dart';
import 'package:ecomarket/ui/home/product_categories_screen.dart';
import 'package:ecomarket/ui/products_list/product_search_bar_widget.dart';
import 'package:ecomarket/ui/info/info_screen.dart';
import 'package:ecomarket/ui/order_history/order_history_screen.dart';
import 'package:ecomarket/ui/products_list/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = 375;
    double height = 812;
    return ScreenUtilInit(
        designSize: Size(width, height),
        builder: (_, child) {
          return BlocProvider(
            create: (_) =>
                CategoryBloc(ApiService())..add(LoadCategoriesEvent()),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: myTheme,
              home: const ProductCategoriesScreen(),
              routes: {
                productCategoryRoute: (context) =>
                    const ProductCategoriesScreen(),
                productListRoute: (context) => const ProductListScreen(),
                cartRoute: (context) => const CartScreen(),
                orderHistoryRoute: (context) => const OrderHistoryScreen(),
                infoRoute: (context) => const InfoScreen(),
                productSearchBarRoute: (context) =>
                    const ProductSearchBarWidget(),
              },
            ),
          );
        });
  }
}
