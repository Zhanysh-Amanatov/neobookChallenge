/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData myTheme = ThemeData(
  primaryColor: const Color(0xFF75DB1B),
  shadowColor: const Color(0xFFD2D1D5),
  hintColor: const Color(0xFFD2D1D5),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'TTNormsPro-Bold',
      fontSize: 24.sp,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'TTNormsPro-Bold',
      fontSize: 20.sp,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'TTNormsPro-Medium',
      fontSize: 14.sp,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'TTNormsPro-Bold',
      fontSize: 20.sp,
      color: const Color(0xFF75DB1B),
    ),
    displaySmall: TextStyle(
      fontFamily: 'TTNormsPro-Medium',
      fontSize: 16.sp,
      color: const Color(0xFFD2D1D5),
    ),
    bodySmall: TextStyle(
      fontFamily: 'TTNormsPro-Medium',
      fontSize: 16.sp,
      color: const Color.fromARGB(255, 255, 255, 255),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: const Color(0xFF75DB1B),
    foregroundColor: Colors.white,
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
    textStyle: TextStyle(
        fontFamily: 'TTNormsPro-Medium',
        fontSize: 16.sp,
        color: const Color(0xFFD2D1D5)),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: const Color(0xFFD2D1D5),
    textStyle: TextStyle(
        fontFamily: 'TTNormsPro-Medium',
        fontSize: 16.sp,
        color: const Color(0xFFD2D1D5)),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        fixedSize: Size(343.w, 55.h),
        backgroundColor: const Color(0xFFF8F8F8),
        foregroundColor: const Color(0xFF1F1F1F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: TextStyle(
          fontFamily: 'TTNormsPro-Medium',
          fontSize: 16.sp,
        )),
  ),
);
