import 'package:contactapp/model/Theme.dart';
import 'package:contactapp/view/addcontact/model/theme/theme.dart';
import 'package:contactapp/view/addcontact/provider/Themeprovider/themeprovider.dart';
import 'package:contactapp/view/addcontact/provider/continueprovider/continueprovider.dart';
import 'package:contactapp/view/addcontact/view/Contact.dart';
import 'package:contactapp/view/home.dart';
import 'package:contactapp/view/introduction%20screen/introduction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool saved_theam = preferences.getBool("save_theam") ?? false;

  bool isvisited = preferences.getBool("Isvisited") ?? false;
  runApp(MultiProvider(
    providers: [
      ListenableProvider<continueprovider>(
        create: (ctx) => continueprovider(),
      ),
      ListenableProvider<TheamProvider>(
        create: (ctx) => TheamProvider(
          myTheamModel: TheamChange(isDark: saved_theam),
        ),
      ),
    ],
    builder: (context, widget) => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isvisited) ? 'home' : '/',
      theme: mytheme().Light,
      darkTheme: mytheme().Dark,
      themeMode:
          (Provider.of<TheamProvider>(context).myTheamModel.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
      routes: {
        '/': (context) => const introduction(),
        'home': (context) => const home(),
        'c': (context) => const contact(),
      },
    ),
  ));
}
