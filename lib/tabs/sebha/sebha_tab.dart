import 'package:flutter/material.dart';
import 'package:new_islamic/providers/sebha_prov.dart';
import 'package:new_islamic/providers/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../style/app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  @override
  Widget build(BuildContext context) {
    final sebhaProv = Provider.of<SebhaProv>(context);
    final settingProvider = Provider.of<SettingProvider>(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: MediaQuery.sizeOf(context).height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  sebhaProv.updateCount(sebhaProv.count + 1);
                },
                child: Image.asset(
                  sebhaProv.backGroundSebhaMode,
                  alignment: Alignment.center,
                  height: MediaQuery.sizeOf(context).height * 0.3,

                ),
              ),
            ],
          ),
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: settingProvider.isDark ? AppTheme.white : AppTheme.black,
          ),
        ),
        Container(
          height:  MediaQuery.sizeOf(context).height * 0.09,
          width:  MediaQuery.sizeOf(context).width * 0.17,
          margin: EdgeInsetsDirectional.all( MediaQuery.sizeOf(context).height * 0.022),
          padding: EdgeInsetsDirectional.all( MediaQuery.sizeOf(context).height * 0.022),
          decoration: BoxDecoration(
            color: settingProvider.isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary,
            borderRadius: BorderRadiusDirectional.circular( MediaQuery.sizeOf(context).height * 0.022),
          ),
          child: Center(
            child: Text(
              sebhaProv.count.toString(),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: settingProvider.isDark ? AppTheme.white : AppTheme.black,
              ),
            ),
          ),
        ),
        Container(
          width: 140,
          margin: EdgeInsetsDirectional.all( MediaQuery.sizeOf(context).height * 0.022),
          padding: EdgeInsetsDirectional.all( MediaQuery.sizeOf(context).height * 0.013),
          decoration: BoxDecoration(
            color: settingProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
            borderRadius: BorderRadiusDirectional.circular( MediaQuery.sizeOf(context).height * 0.03),
          ),
          child: Center(
            child: Text(
              sebhaProv.text,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: settingProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
