import 'package:contactapp/theme/theme.dart';
import 'package:contactapp/view/Contact.dart';
import 'package:contactapp/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme().Light,
      routes: {
        '/': (context) => home(),
        'c': (context) => Contact(),
      },
    ),
  );
}
