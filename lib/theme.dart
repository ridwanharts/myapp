import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.black,
  ),
);
