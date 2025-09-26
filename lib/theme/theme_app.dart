import 'package:flutter/material.dart';

import 'color_pallete.dart';

class ThemeApp {
  static ThemeData themes = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true,foregroundColor: ColorPallete.primaryColor,
      backgroundColor:Colors.black,
      titleTextStyle: TextStyle(
        fontFamily: "janna",
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: ColorPallete.primaryColor,
      ),
    ),
    iconTheme: IconThemeData(color: ColorPallete.primaryColor),
    primaryColor: ColorPallete.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPallete.primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(
        fontFamily: 'janna',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: "janna",
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFF000000),
      ),
      titleLarge: TextStyle(
        fontFamily: "janna",
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Color(0xFF000000),
      ),
      bodyLarge: TextStyle(
        fontFamily: "janna",
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFEFFE8),
      ),
      bodyMedium: TextStyle(
        fontFamily: "janna",
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFFFFFFFF),
      ),
      bodySmall: TextStyle(
        fontFamily: "janna",
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: Color(0xFFFFFFFF),
      ),
    ),
  );
}