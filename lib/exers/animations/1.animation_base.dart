import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


/// 动画基础
/// 控制器 AnimationController
/// 补间   Tween

class Demo extends StatefulWidget {
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        // 注意是 milliseconds  不是 microseconds
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    // Dart 级联符号：A..B   使用 A 的返回值调用 B
      ..addListener(() {
        // 调用 setState()  每次动画生成一个新数字时，会标记当前帧为 dirty，这样会导致 build() 方法再次被调用
        setState(() {
          //
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    // 动画完成用 dispose() 防止内存泄漏
    controller.dispose();
    super.dispose();
  }
}