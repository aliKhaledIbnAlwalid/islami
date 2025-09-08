import 'package:flutter/material.dart';

import '../Theme Data/my_theme.dart';
import 'Sura.dart';

class SuraName extends StatefulWidget {
  String text_L;
  String Text_R;
  int index;

  SuraName({required this.text_L, required this.Text_R, required this.index});

  @override
  State<SuraName> createState() => _SuraNameState();
}

class _SuraNameState extends State<SuraName> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Sura.routName,
            arguments:
                SuraDetailesArgs(name: widget.text_L, index: widget.index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.index}",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.left,
          ),
          Text(
            widget.text_L,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            widget.Text_R,
            style: Theme.of(context).textTheme.titleMedium, 
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
