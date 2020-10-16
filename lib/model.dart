import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// 这是一个 code model
/// 每次新的 demo 都需要这个基础模板

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 ",
      home: Test_Util(),
    );
  }
}


class Test_Util extends StatefulWidget {
  @override
  _Test_State createState() => _Test_State();
}

class _Test_State extends State<Test_Util> {

  @override
  void initState() {
    super.initState();
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
      body: Center(),
    );
  }
}
