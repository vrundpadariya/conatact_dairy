import 'package:flutter/material.dart';

class mytheme {
  static ThemeData Light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.red,
  );

  static ThemeData Dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: Colors.purple,
  );
}
