import 'package:flutter/cupertino.dart';

class TestProvide1 extends ChangeNotifier {
  String str1 = "C";
  changeStr1() {
    if (str1 == "C")
      str1 = "D";
    else
      str1 = "C";
    notifyListeners();
  }
}
