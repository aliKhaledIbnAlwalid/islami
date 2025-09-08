import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightprim = Color(0xFFB7935F);
  static Color darkprim = Color(0xFFFACC1D);
  static Color colorblack = Color(0xFF242424);
  static Color colorwihte = Color(0xFFFFFFFF);
  static Color lightprimlow = Color(0xFFB7935F);
  static Color darksec = Color(0xFF141A2E);
  static ThemeData lightTheme = ThemeData(
      primaryColor: lightprim,
      // backgroundColor: colorwihte,
      dividerColor: lightprim,
      hoverColor: colorwihte,
      iconTheme: IconThemeData(color: lightprim),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStateProperty.all(lightprim))),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: colorblack)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightprim,
          selectedItemColor: colorblack,
          unselectedItemColor: colorwihte),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: MyThemeData.colorblack,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        displayMedium: TextStyle(
            color: MyThemeData.colorblack,
            fontWeight: FontWeight.w400,
            fontSize: 25),
        titleMedium: TextStyle(
            color: MyThemeData.colorblack,
            fontWeight: FontWeight.w500,
            fontSize: 25),
        displaySmall: TextStyle(
            color: MyThemeData.lightprim,
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ));
  static ThemeData darktheme = ThemeData(
      primaryColor: darksec,
      hoverColor: darksec,
      // backgroundColor: darksec,
      dividerColor: darkprim,
      iconTheme: IconThemeData(color: darkprim),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(darkprim),
              backgroundColor: MaterialStateProperty.all(darkprim))),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: colorblack)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darksec,
          selectedItemColor: darkprim,
          unselectedItemColor: colorwihte),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        displayMedium: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.w400,
            fontSize: 25),
        titleMedium: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.w500,
            fontSize: 25),
        displaySmall: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ));
}
