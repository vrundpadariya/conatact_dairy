import 'package:contactapp/model/Theme.dart';
import 'package:contactapp/view/addcontact/model/theme/theme.dart';
import 'package:contactapp/view/addcontact/provider/Themeprovider/themeprovider.dart';
import 'package:contactapp/view/addcontact/provider/contactprovider/contact%20provider.dart';
import 'package:contactapp/view/addcontact/provider/continueprovider/continueprovider.dart';
import 'package:contactapp/view/addcontact/view/Contact.dart';
import 'package:contactapp/view/detail/view/detail.dart';
import 'package:contactapp/view/home.dart';
import 'package:contactapp/view/introduction%20screen/introduction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // bool saved_theam = preferences.getBool("save_theam") ?? false;
  bool isDark = preferences.getBool('isDark') ?? false;
  bool isvisited = preferences.getBool("Isvisited") ?? false;
  runApp(MultiProvider(
    providers: [
      ListenableProvider<continueprovider>(
        create: (ctx) => continueprovider(),
      ),
      ListenableProvider<ContactProvider>(
        create: (ctx) => ContactProvider(),
      ),
      ListenableProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(theme: ThemeModel(isDark: isDark))),
    ],
    builder: (context, widget) => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isvisited) ? 'home' : '/',
      theme: mytheme.Light,
      darkTheme: mytheme.Dark,
      themeMode: (Provider.of<ThemeProvider>(context).theme.isDark == true)
          ? ThemeMode.dark
          : ThemeMode.light,
      routes: {
        '/': (context) => const introduction(),
        'home': (context) => home(),
        'd': (context) => contact(),
        'c': (context) => Contact_Detail(),
      },
    ),
  ));
}
