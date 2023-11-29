import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel theme;
  ThemeProvider({required this.theme});
  void changeTheme() async {
    theme.isDark = !theme.isDark;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool("isDark", theme.isDark);
    notifyListeners();
  }
}
