/*External dependencies */
import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    primaryColor: const Color(0xFF75DB1B),
    shadowColor: const Color(0xFFD2D1D5),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'TTNormsPro-Bold',
        fontSize: 24,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'TTNormsPro-Bold',
        fontSize: 20,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'TTNormsPro-Medium',
        fontSize: 14,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'TTNNormsPro-Bold',
        fontSize: 20,
        color: Color(0xFF75DB1B),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF75DB1B),
            foregroundColor: Colors.white)));
