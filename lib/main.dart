import 'package:contactapp/view/addcontact/view/Contact.dart';
import 'package:contactapp/view/home.dart';
import 'package:flutter/material.dart';

import 'model/theme/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme().Light,
      routes: {
        '/': (context) => home(),
        'c': (context) => contact(),
      },
    ),
  );
}
