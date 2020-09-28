import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in/exerProvide/useProvide.dart';
import 'package:flutter_in/exerProvide/useProvide1.dart';
import 'package:provide/provide.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 provide",
      home: TestUseProvide(),
    );
  }
}

/// 测试 使用 provide

class TestUseProvide extends StatefulWidget {
  @override
  State<TestUseProvide> createState() => _TestUseProvideState();
}

class _TestUseProvideState extends State<TestUseProvide> {
  String str1;
  String str2;

  @override
  void initState() {
    super.initState();
    str1 = "小明";
    str2 = "A";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试复用组件"),
        ),
        body:
            // Provide<TestProvide>(
            //   builder: (context,child,model){
            //     print("$model============");
            //     return
            temp());
    //   },
    // ));
  }

  Widget temp() {
    print("temp0000000000000");
    return RepaintBoundary(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textWidget("$str1", "11111111111111111111"),
          // textWidget("$str2", "2222222222222222"),
          // Provide<TestProvide>(
          //   builder: (context,child,model){
          //     // return textWidget("${Provide.value<TestProvide>(context).str}",
          //     //     "2222222222222222");
          //     return Column(
          //       children: [
          //     textWidget("${Provide.value<TestProvide>(context).str}","2222222222222222"),
          //     textWidget("${Provide.value<TestProvide>(context).str1}","3333333333333333"),
          //       ],
          //     );
          //   },
          // ),
          Provide<TestProvide>(
            builder: (context, child, model) {
              return textWidget("${Provide.value<TestProvide>(context).str}",
                  "2222222222222222");
            },
          ),
          Provide<TestProvide1>(
            builder: (context, child, model) {
              return textWidget("${Provide.value<TestProvide1>(context).str1}",
                  "3333333333333333");
            },
          ),
          FlatButton(
              onPressed: () {
                // setState(() {
                //   if(str2 == "A")
                //     str2 = "B";
                //   else
                //     str2 = "A";
                // });
                Provide.value<TestProvide>(context).changeStr();
              },
              color: Colors.white,
              child: Text(
                "点击改变文字",
              ))
        ],
      ),
    ));
  }

  Widget textWidget(string, printS) {
    print("$printS");
    return InkWell(
      child: Text(string),
    );
  }
}
