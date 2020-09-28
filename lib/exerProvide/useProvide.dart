import 'package:flutter/cupertino.dart';

class TestProvide extends ChangeNotifier {
  String str = "A";
  // String str1 = "C";
  changeStr() {
    print("::::::::::::::::::");
    if (str == "A")
      str = "B";
    else
      str = "A";
    notifyListeners();
  }
  // changeStr1(){
  //   if(str1 == "C")
  //     str1 = "D";
  //   else
  //     str1 = "C";
  //   notifyListeners();
  // }
}

// class TestProvide1 extends ChangeNotifier{
//   String str1 = "C";
//   changeStr1(){
//     if(str1 == "C")
//       str1 = "D";
//     else
//       str1 = "C";
//     notifyListeners();
//   }
// }
