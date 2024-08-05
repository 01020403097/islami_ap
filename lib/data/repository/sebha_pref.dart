import 'package:shared_preferences/shared_preferences.dart';

class SebhaPref {
  static const _countKey = 'count';
  static const _textKey = 'text';

  Future<void> saveCount(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_countKey, count);
  }

  Future<int> getCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_countKey) ?? 0;
  }

  Future<void> saveText(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_textKey, text);
  }

  Future<String> getText() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_textKey) ?? '';
  }
}
