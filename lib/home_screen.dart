import 'package:flutter/material.dart';
import 'package:new_islamic/providers/setting_provider.dart';
import 'package:new_islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:new_islamic/tabs/quraan/quraan_tab.dart';
import 'package:new_islamic/tabs/radio/radio_tab.dart';
import 'package:new_islamic/tabs/sebha/sebha_tab.dart';
import 'package:new_islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routScreen = 'routeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabScreens = [
    QuraanTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingProvider.backGroundImageName),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        backgroundColor: Colors.transparent,
        body: tabScreens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items:  [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/moshaf_gold.png'),
                ),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png'),
                ),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_sebha.png'),
                ),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_radio.png'),
                ),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: AppLocalizations.of(context)!.settings),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
