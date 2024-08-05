import 'package:flutter/material.dart';
import 'package:new_islamic/providers/radio_prov.dart';
import 'package:new_islamic/providers/sebha_prov.dart';
import 'package:provider/provider.dart';
import 'package:new_islamic/providers/setting_provider.dart';
import 'package:new_islamic/style/app_theme.dart';
import 'package:new_islamic/tabs/hadeth/hadeath_details_screen.dart';
import 'package:new_islamic/tabs/quraan/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingProvider = SettingProvider();
  await settingProvider.loadPreferences();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingProvider>.value(value: settingProvider),
        ChangeNotifierProvider<SebhaProv>(
          create: (context) => SebhaProv()..loadPreferences(),
        ),
        ChangeNotifierProvider(create: (context) => RadioProv(),)
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.language),
      initialRoute: HomeScreen.routScreen,
    );
  }
}
