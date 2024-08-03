import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';
import '../../style/app_theme.dart';
import 'hadeth.dart';

class HadeathDetailsScreen extends StatelessWidget {
  static const routeName = 'hadeathDetailsScreen';

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);

    Hadeth hadethArgs = ModalRoute
        .of(context)!
        .settings
        .arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage( settingProvider.backGroundImageName),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadethArgs.title),
        ),
        body: Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery
                    .sizeOf(context)
                    .height * 0.06,
                horizontal: MediaQuery
                    .sizeOf(context)
                    .width * 0.07),
            decoration: BoxDecoration(
                color: settingProvider.isDark ? AppTheme
                    .darkPrimary : AppTheme.white,
                borderRadius: BorderRadius.circular(25)),
        child: ListView.builder(
          itemCount: hadethArgs.content.length,
          itemBuilder: (context, index) =>
              Text(
                hadethArgs.content[index],
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
                textAlign: TextAlign.center,
              ),
        ),
      ),
    )
    ,
    );
  }
}
