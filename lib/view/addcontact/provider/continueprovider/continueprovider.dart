import 'package:contactapp/view/addcontact/model/continue/continuemodel.dart';
import 'package:flutter/cupertino.dart';

class continueprovider extends ChangeNotifier {
  Continue c = Continue(Currentstep: 0);
  void Continuestep() {
    if (c.Currentstep != 3) {
      c.Currentstep++;
    }

    notifyListeners();
  }

  void cancelstep() {
    if (c.Currentstep != 0) {
      c.Currentstep--;
    }

    notifyListeners();
  }
}
