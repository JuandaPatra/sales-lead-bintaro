import 'package:flutter/material.dart';


ThemeData MyThemeData() {
  return ThemeData(
      visualDensity: VisualDensity(horizontal: 4, vertical: 0),
      primarySwatch: Colors.lightBlue,
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white)),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black54)));
}
