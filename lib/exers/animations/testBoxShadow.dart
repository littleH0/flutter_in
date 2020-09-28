

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 boxShadow",
      home: TestBoxShadow(),
    );
  }
}

class TestBoxShadow extends StatefulWidget{
  @override
  _TestBoxShadowState createState ()=> _TestBoxShadowState();
}

class _TestBoxShadowState extends State<TestBoxShadow>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 boxShadow"),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xff074A97),
            boxShadow:([BoxShadow(
              // color: Colors.black45,
              color: Colors.red,
              offset: Offset(-2.0,3.0),
              blurRadius: 3.0,
              spreadRadius: 1.0
            ),])
          ),
        ),
      ),
    );
  }

}
