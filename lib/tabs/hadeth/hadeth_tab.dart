import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_islamic/tabs/hadeth/hadeath_details_screen.dart';

import '../../widgets/loading_indicator.dart';
import 'hadeth.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

List<Hadeth> ahadeth = [];

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    loadAhadethFile();
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child:ahadeth.isEmpty?LoadingIndicator(): ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
            itemCount: ahadeth.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  HadeathDetailsScreen.routeName,arguments: ahadeth[index]
                );
              },
              child: Text(
                ahadeth[index].title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadethFileContent.split('#');

    ahadeth= ahadethText.map((hadethText) {
     List<String>hadethLines= hadethText.trim().split('\n');
     String title=hadethLines.first;
     hadethLines.removeAt(0);
     List<String>content= hadethLines;
    return Hadeth(title: title, content: content);
     },

  ).toList();
    setState(() {

    });
  }
}
