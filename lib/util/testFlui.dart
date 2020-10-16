import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 ",
      home: TestFlui(),
    );
  }
}


class TestFlui extends StatefulWidget {
  @override
  _TestFluiState createState() => _TestFluiState();
}

class _TestFluiState extends State<TestFlui> {
  Function fun;
  Map testMap = Map();
  @override
  void initState() {
    super.initState();
    // 测试Map操作
    testMap["xia"] = false;
    testMap["sf"] = true;
    testMap["qw"] = null;
    testMap.forEach((key, value) {
      print("$key : $value");
      print(value??"uio");
      // true   false  都是非空，??  是空才会执行后面的操作
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 "),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                fun = FLToast.loading(text:"Loading");
              },
              child: Text("Loading"),
            ),
            FlatButton(
              onPressed: (){
                fun = FLToast.loading(text:"Loading");
              },
              child: Text("Loading"),
            ),
            FlatButton(
              onPressed: (){
                fun();
              },
              child: Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
