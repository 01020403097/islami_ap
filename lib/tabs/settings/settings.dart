import 'package:flutter/material.dart';
import 'package:new_islamic/style/app_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Switch(
                  activeTrackColor: AppTheme.gold,
                  inactiveTrackColor: Colors.grey,
                  value: settingProvider.themeMode == ThemeMode.dark,
                  onChanged: (isDark) => settingProvider
                      .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: settingProvider.isDark ? AppTheme
                      .gold : AppTheme.white,
                  style: TextStyle(color: settingProvider.isDark ? AppTheme
                      .white : AppTheme.darkPrimary,),

                  borderRadius: BorderRadius.circular(25),
                  value: settingProvider.language,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English',),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text('العربيه'),
                    ),
                  ],
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage == null) return;
                    settingProvider.changeLanguage(selectedLanguage);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
