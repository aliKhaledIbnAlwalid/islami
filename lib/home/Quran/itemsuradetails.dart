import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget {
  String text;
  int index;

  ItemSuraDetails({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '$text (${index + 1})',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
