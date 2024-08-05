import 'package:flutter/material.dart';
import '../data/repository/sebha_pref.dart';

class SebhaProv with ChangeNotifier {
  int _count = 0;
  String _text = '';

  int get count => _count;
  String get text => _text;

  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.light;
  String get backGroundSebhaMode =>
      'assets/images/${isDark ? 'sebha_dark' : 'sebha_light'}.png';

  final SebhaPref _sebhaPref = SebhaPref();

  SebhaProv() {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    _count = await _sebhaPref.getCount();
    _text = await _sebhaPref.getText();
    notifyListeners();
  }

  Future<void> _savePreferences() async {
    await _sebhaPref.saveCount(_count);
    await _sebhaPref.saveText(_text);
  }

  void updateCount(int newCount) {
    _count = newCount;
    onChangeCounter(newCount);
  }

  void onChangeCounter(int index) {
    if (index > 0 && index < 30) {
      _text = 'سبحان الله';
    } else if (index >= 30 && index < 60) {
      _text = 'الحمد لله';
    } else if (index >= 60 && index <= 90) {
      _text = 'لا اله الا الله';
    } else if (index > 90) {
      _text = '0';
      _count = 0;
    }

    _savePreferences();
    notifyListeners();
  }
}
