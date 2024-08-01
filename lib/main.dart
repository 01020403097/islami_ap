import 'package:flutter/material.dart';
import 'package:new_islamic/style/app_theme.dart';
import 'package:new_islamic/tabs/hadeth/hadeath_details_screen.dart';
import 'package:new_islamic/tabs/quraan/sura_details_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routScreen: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadeathDetailsScreen.routeName: (_) => HadeathDetailsScreen(),

      },

      initialRoute: HomeScreen.routScreen,

    );

  }
}
