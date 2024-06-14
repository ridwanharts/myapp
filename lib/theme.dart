import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  accentColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 20),
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  accentColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.black,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 20),
    ),
  ),
);
