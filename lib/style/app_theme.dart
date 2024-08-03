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
    ),
    appBarTheme: AppBarTheme(
       centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,

      ),
    ),
    textTheme: TextTheme(

      headlineSmall: TextStyle(fontSize: 25,fontWeight:FontWeight.w400,color: Colors.black ),
      titleLarge: TextStyle(fontSize: 20,fontWeight:FontWeight.w400,color: Colors.black ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(AppTheme.white),
    )

  );




  static  ThemeData darkTheme=ThemeData(

    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkPrimary,
      selectedItemColor: gold,
      unselectedItemColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: white,
      titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    ),
    textTheme: TextTheme(

      headlineSmall: TextStyle(fontSize: 25,fontWeight:FontWeight.w400,color: Colors.white ),
      titleLarge: TextStyle(fontSize: 20,fontWeight:FontWeight.w400,color:gold ),
    ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(AppTheme.white),
      )
  );





}