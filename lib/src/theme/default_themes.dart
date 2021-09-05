import 'package:flutter/material.dart';

import 'text_keys.dart';

part 'text_theme_definations.dart';

class DefaultThemes {
  static ThemeData get defaultDarkThemeData => ThemeData(
        appBarTheme: AppBarTheme().copyWith(textTheme: TextTheme().merge(_TextThemeDefinations.dark)),
        brightness: Brightness.dark,
        cardTheme: CardTheme(color: Colors.green[800]),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
          foregroundColor: Colors.green[50],
          backgroundColor: Colors.green[700],
        ),
        iconTheme: IconThemeData().copyWith(color: Colors.green[300]),
        primaryColor: Colors.green[800],
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          onSurface: Colors.blueGrey,
          primary: Colors.green[600],
        )),
        textTheme: TextTheme().merge(_TextThemeDefinations.dark),
      );

  static ThemeData get defaultLightThemeData => ThemeData(
        appBarTheme: AppBarTheme(), //.copyWith(textTheme: TextTheme().merge(_TextThemeDefinations.light)),
        brightness: Brightness.light,
        cardTheme: CardTheme(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(),
        iconTheme: IconThemeData().copyWith(color: Colors.blueAccent),
        primaryColor: Colors.blueAccent,
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          onSurface: Colors.grey,
          primary: Colors.green[600],
        )),
        textTheme: TextTheme().merge(_TextThemeDefinations.light),
      );
}
