import 'package:flutter/material.dart';
import 'package:new_islamic/providers/setting_provider.dart';

class RadioProv with ChangeNotifier{

  SettingProvider settingProvider=SettingProvider();

  String get radioPrevPlay =>
      'assets/images/${settingProvider.isDark ? 'prev_dark' : 'prev'}.png';
  String get radioPlay =>
      'assets/images/${settingProvider.isDark  ? 'play_dark' : 'play'}.png';
  String get radioNextPlay =>
      'assets/images/${settingProvider.isDark  ? 'next_dark' : 'next'}.png';


}