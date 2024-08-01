import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static const Color lightPrimary=Color(0xFFB7935F);
  static const Color darkPrimary=Color(0xFF141A2E);
  static const Color black=Color(0xFF242424);
  static const Color white=Color(0xFFFFFFFF);
  static const Color gold=Color(0xFFFACC1D);



  static  ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightPrimary,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    )

  );
  static  ThemeData darkTheme=ThemeData();





}