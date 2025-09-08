import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import '../../providers/themeProvider.dart';
import '../Theme Data/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double turns = 2.0;
  int tasbeehCount = 0;
  String Tasbeh = 'سبحان الله';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH = Provider.of<ThemeProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio * 24,
                ),
                child: Image.asset(
                  providerTH.apptheme == ThemeMode.light
                      ? "assets/images/head of seb7a.png"
                      : "assets/images/head_sebha_dark.png",
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  tasbeehCount++;
                  setState(() => turns += 1 / 4);
                  if (counter == 0) {
                    Tasbeh = 'سبحان الله';
                    setState(() {});
                  }
                  if (tasbeehCount % 33 == 0) {
                    counter++;
                  }
                  if (tasbeehCount % 33 == 0 && counter == 1) {
                    Tasbeh = 'الحمد الله';
                    setState(() {});
                  }
                  if (tasbeehCount % 33 == 0 && counter == 2) {
                    Tasbeh = 'الله اكبر';
                    setState(() {});
                  }
                  if (counter == 3) {
                    counter = 0;
                  }
                },
                onLongPress: () {
                  Tasbeh = 'سبحان الله';
                  tasbeehCount = 0;
                  counter = 0;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 30,
                  ),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      providerTH.apptheme == ThemeMode.light
                          ? "assets/images/body of seb7a.png"
                          : "assets/images/body of seb7a_dark.png",
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              AppLocalizations.of(context)!.numberofTasbeh,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Text('$tasbeehCount',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              Tasbeh,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ],
      ),
    );
  }
}
