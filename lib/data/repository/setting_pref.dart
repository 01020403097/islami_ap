import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPref {
  static const _themeModeKey = 'themeMode';
  static const _languageKey = 'language';

  static Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs.setString(_themeModeKey, themeString);
  }

  static Future<ThemeMode> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeModeKey) ?? 'dark';
    return themeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  static Future<String> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'en';
  }
}
