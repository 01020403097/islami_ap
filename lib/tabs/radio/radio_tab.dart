import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/setting_provider.dart';
import '../../style/app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/radio_image.png',
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
        ),
        // Title text
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: settingProvider.isDark ? AppTheme.white : AppTheme.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.18,
          child: Row(
            children: [
              Expanded(child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(settingProvider.radioPrevPlay))),
              GestureDetector(onTap: () {}, child: Image.asset(settingProvider.radioPlay)),
              Expanded(child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(settingProvider.radioNextPlay))),
            ],
          ),
        ),
      ],
    );
  }
}
