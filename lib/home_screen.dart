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
              image: AssetImage(

                  settingProvider.backGroundImageName),

          ),),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        backgroundColor: Colors.transparent,
        body: tabScreens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/moshaf_gold.png'),
                ),
                label: 'Quran'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png'),
                ),
                label: 'hadeth'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_sebha.png'),
                ),
                label: 'sebha'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_radio.png'),
                ),
                label: 'radio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'settings'),
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
