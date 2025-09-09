import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
import '../../providers/themeProvider.dart';
import '../../My Theme Data/my_theme.dart';
import 'Hadeth.dart';

class HadethContent extends StatefulWidget {
  static const String routName = "Hadeth";
  HadethTab hadeth = HadethTab();

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH = Provider.of<ThemeProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethArgs;
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
          title: Text("${args.title}",
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
            child: Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      '${args.content[index]}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                  itemCount: args.content.length),
            ),
          ),
        ),
      )
    ]);
  }
}
