import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      //Background
      background: Colors.white,
      //habit Tile / alert dialog
      primary: Colors.grey.shade300,
      //Text / borders
      secondary: Colors.black,
      //slideable
      tertiary: Colors.grey.shade200),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      //Background
      background: Colors.black,
      //Habit tile / alert Dialog
      primary: Colors.grey.shade900,
      //Text
      secondary: Colors.white,
      //Slideable
      tertiary: Colors.grey.shade800),
);
