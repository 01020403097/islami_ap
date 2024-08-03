import 'package:flutter/material.dart';
import 'package:new_islamic/providers/setting_provider.dart';
import 'package:new_islamic/style/app_theme.dart';
import 'package:new_islamic/tabs/hadeth/hadeath_details_screen.dart';
import 'package:new_islamic/tabs/quraan/sura_details_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context)=>SettingProvider(),
      child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingProvider.themeMode,
      routes: {
        HomeScreen.routScreen: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadeathDetailsScreen.routeName: (_) => HadeathDetailsScreen(),

      },

      initialRoute: HomeScreen.routScreen,

    );

  }
}
