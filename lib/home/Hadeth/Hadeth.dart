import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/home/Hadeth/hadethContent.dart';

import '../../My Theme Data/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethArgs> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      LoadHadethFile();
    }
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset(
                'assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png')),
        Divider(
          color: MyThemeData.lightprim,
          thickness: 2,
        ),
        Text(AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center),
        Divider(
          color: MyThemeData.lightprim,
          thickness: 2,
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: hadethList.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: MyThemeData.lightprim,
                            thickness: 2,
                          );
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    HadethContent.routName,
                                    arguments: HadethArgs(
                                        content: hadethList[index].content,
                                        title: hadethList[index].title));
                              },
                              child: Text(
                                hadethList[index].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium,
                              ));
                        },
                        itemCount: hadethList.length),
              )
            ],
          ),
        )
      ],
    );
  }

  void LoadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> allAhadethlist = fileContent.split('#\r\n');
    for (int i = 0; i < allAhadethlist.length; i++) {
      List<String> singlehadeth = allAhadethlist[i].split('\n');
      String title = singlehadeth[0];
      singlehadeth.removeAt(0);
      HadethArgs hadeth = HadethArgs(content: singlehadeth, title: title);
      hadethList.add(hadeth);
    }
    setState(() {});
  }
}

class HadethArgs {
  String title;
  List<String> content;

  HadethArgs({required this.content, required this.title});
}
