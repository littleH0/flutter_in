import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 sort",
      home: TestSort(),
    );
  }
}

/// 测试 按照 List 中元素 Map 中某一字段排序

class TestSort extends StatefulWidget {
  @override
  State<TestSort> createState() {
    return TestSortState();
  }
}

class TestSortState extends State<TestSort> with TickerProviderStateMixin {
  List<Map> lm;

  @override
  void initState() {
    super.initState();
    // lm = [
    //   {"name": "A", "age": 16},
    //   {"name": "B", "age": 14},
    //   {"name": "C", "age": 12},
    //   {"name": "D", "age": 10},
    // ];
    lm = [];
  }

  // 对 List<Map> 按某一字段排序
  void sortMethod() {
    print(lm);
    lm.sort((a, b) => a["age"].compareTo(b["age"]));
    print(lm);
    lm.sort((a, b) => b["age"].compareTo(a["age"]));
    print(lm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试  sort"),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    sortMethod();
                  },
                  color: Colors.white,
                  child: Text(
                    "点击排序",
                  ))
            ],
          ),
        ));
  }
}
