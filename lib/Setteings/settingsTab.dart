import 'package:flutter/material.dart';
import 'package:islamiapp/Setteings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
import '../providers/themeProvider.dart';
import 'Theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: () {
              showBottom_Sheet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.displayMedium),
                Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: () {
              showBottom_Sheet_Th(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Thememodename(providerTH.apptheme, context),
                    style: Theme.of(context).textTheme.displayMedium),
                Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          ),
        )
      ],
    );
  }

  void showBottom_Sheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        },
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }

  void showBottom_Sheet_Th(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }

  String Thememodename(ThemeMode theme, context) {
    if (theme == ThemeMode.light) {
      return AppLocalizations.of(context)!.light;
    } else if (theme == ThemeMode.dark) {
      return AppLocalizations.of(context)!.dark;
    }
    return AppLocalizations.of(context)!.system;
  }
}
