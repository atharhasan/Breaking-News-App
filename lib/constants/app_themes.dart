import 'package:breaking_news/constants/colors_app.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyText2: TextStyle(fontSize: 12, color: Colors.black)),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.brown),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appColor,
        titleTextStyle: TextStyle(
            color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyText2: TextStyle(fontSize: 12, color: Colors.white),
    ),
  );
}
