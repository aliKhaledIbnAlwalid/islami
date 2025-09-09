import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/home/Quran/itemsuradetails.dart';
import 'package:islamiapp/My%20Theme%20Data/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import '../../providers/themeProvider.dart';

class Sura extends StatefulWidget {
  static const String routName = "Sura";

  @override
  State<Sura> createState() => _SuraState();
}

class _SuraState extends State<Sura> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH = Provider.of<ThemeProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailesArgs;
    if (verses.isEmpty) {
      LoadFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        providerTH.apptheme == ThemeMode.light
            ? "assets/images/backgroundimage.png"
            : "assets/images/bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text("${args.name}",
              style: Theme.of(context).textTheme.displayLarge),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(24),
            ),
            child: verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                        text: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
          ),
        ),
      )
    ]);
  }

  void LoadFile(index) async {
    String filecontent =
        await rootBundle.loadString('assets/files/${index}.txt');
    List<String> lines = filecontent.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailesArgs {
  String name;
  int index;

  SuraDetailesArgs({required this.name, required this.index});
}
