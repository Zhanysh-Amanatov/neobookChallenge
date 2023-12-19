/*External dependecies */
import 'package:ecomarket/screens/products_list/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/screens/product_categories_screen.dart';
import 'package:ecomarket/screens/products_list/product_list_screen.dart';
import 'package:ecomarket/theme.dart';

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
          return MaterialApp(
            title: 'Flutter Demo',
            theme: myTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => const ProductCategories(),
              '/productList': (context) => const ProductList()
            },
          );
        });
  }
}
