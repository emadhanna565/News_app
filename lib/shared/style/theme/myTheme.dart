import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        toolbarHeight: 70,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xff4f5a69),
        ),
        bodySmall: TextStyle(
          fontSize: 22,
          color: Color(0xffFFFFFF),
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        titleMedium: TextStyle(fontSize: 10, color: Color(0xff79828B)),
        titleLarge: TextStyle(
          fontSize: 13,
          color: Color(0xffa3a3a3),
        ),
      ));
}
