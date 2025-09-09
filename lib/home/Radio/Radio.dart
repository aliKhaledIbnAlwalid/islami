import 'package:flutter/material.dart';
import 'package:islamiapp/My%20Theme%20Data/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              AppLocalizations.of(context)!.quranKareemRadio,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.play_arrow, size: 45)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.skip_next, size: 45))
            ],
          )
        ],
      ),
    );
  }
}
