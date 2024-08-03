import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier{
ThemeMode themeMode=ThemeMode.dark;
String language='en';
bool get isDark=>themeMode==ThemeMode.dark;
String get backGroundImageName=>'assets/images/${isDark?'dark_bg':'default_bg'}.png';
void changeTheme(ThemeMode selectThemeMode){

  themeMode=selectThemeMode;
  notifyListeners();
}

void changeLanguage(String lang){
  language=lang;
  notifyListeners();
}
}