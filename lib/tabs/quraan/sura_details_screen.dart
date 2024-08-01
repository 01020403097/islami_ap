import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_islamic/style/app_theme.dart';
import 'package:new_islamic/tabs/quraan/quraan_tab.dart';

import '../../widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late SuraDetailsArguments args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
  if(ayat.isEmpty){  loadSuraFile();}
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.SuraName),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.06,
              horizontal: MediaQuery.sizeOf(context).width * 0.07),
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(25)),
          child: ayat.isEmpty?LoadingIndicator():ListView.builder(
            itemCount: ayat.length,
            itemBuilder: (context, index) => Text(
              ayat[index],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile()async {
 String sura=  await rootBundle.loadString('assets/files/${args.index + 1}.txt');
 ayat=sura.split('\r\n');
 setState(() {

 });
  }
}
