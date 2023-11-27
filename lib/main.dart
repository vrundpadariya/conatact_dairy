import 'package:contactapp/view/addcontact/provider/continueprovider/continueprovider.dart';
import 'package:contactapp/view/addcontact/view/Contact.dart';
import 'package:contactapp/view/home.dart';
import 'package:contactapp/view/introduction%20screen/introduction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isvisited = preferences.getBool("Isvisited") ?? false;
  runApp(MultiProvider(
    providers: [
      ListenableProvider<continueprovider>(
        create: (ctx) => continueprovider(),
      )
    ],
    builder: (context, widget) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme().Light,
      initialRoute: (isvisited) ? 'home' : '/',
      routes: {
        '/': (context) => const introduction(),
        'home': (context) => const home(),
        'c': (context) => const contact(),
      },
    ),
  ));
}
