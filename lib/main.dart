/*External dependecies */
import 'package:ecomarket/screens/product_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
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
            home: const ProductCategories(),
          );
        });
  }
}
