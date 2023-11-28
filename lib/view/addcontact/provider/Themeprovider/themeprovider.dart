import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/theme/theme.dart';

class TheamProvider extends ChangeNotifier {
  TheamChange myTheamModel;

  TheamProvider({required this.myTheamModel});

  void ChangeTheam() async {
    myTheamModel.isDark = !myTheamModel.isDark;
    SharedPreferences save_my_theam = await SharedPreferences.getInstance();
    save_my_theam.setBool("save_theam", myTheamModel.isDark);
    notifyListeners();
  }
}
