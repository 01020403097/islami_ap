import 'package:flutter/material.dart';
import '../data/repository/setting_pref.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _language = 'en';

  ThemeMode get themeMode => _themeMode;

  String get language => _language;

  bool get isDark => _themeMode == ThemeMode.dark;

  String get backGroundImageName =>
      'assets/images/${isDark ? 'dark_bg' : 'default_bg'}.png';
  String get radioPrevPlay =>
      'assets/images/${isDark ? 'prev_dark' : 'prev'}.png';
  String get radioPlay =>
      'assets/images/${isDark ? 'play_dark' : 'play'}.png';
  String get radioNextPlay =>
      'assets/images/${isDark ? 'next_dark' : 'next'}.png';

  SettingProvider() {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    _themeMode = await SettingPref.loadThemeMode();
    _language = await SettingPref.loadLanguage();
    notifyListeners();
  }

  Future<void> _savePreferences() async {
    await SettingPref.saveThemeMode(_themeMode);
    await SettingPref.saveLanguage(_language);
  }

  void changeTheme(ThemeMode selectThemeMode) {
    if (_themeMode != selectThemeMode) {
      _themeMode = selectThemeMode;
      _savePreferences();
      notifyListeners();
    }
  }

  void changeLanguage(String lang) {
    if (_language != lang) {
      _language = lang;
      _savePreferences();
      notifyListeners();
    }
  }
}
