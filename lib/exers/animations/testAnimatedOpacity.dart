import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 AnimatedOpacity",
      home: OpacityAnimation(),
    );
  }
}

class OpacityAnimation extends StatefulWidget {
  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  // 控制动画显示状态变量
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    print("build--");
    return Scaffold(
      appBar: AppBar(
        title: Text('淡入淡出动画'),
      ),
      body: Center(
        child: AnimatedOpacity(
          // 控制 opacity 值，范围从 0.0 到 1.0
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 控制动画显示状态
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: " 显示隐藏 ",
        child: Icon(Icons.flip),
      ),
    );
  }
}
