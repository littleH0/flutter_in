/// 监视动画的过程  addStatusListener
/// 使用 addStatusListener 来处理动画状态更改的通知，例如：启动、停止、反转方向
/// 当动画完成或改变其开始状态时，通过反转方向来无线循环运行动画

/// AnimationStatus
/// dismissed  回到动画起点处
/// forward    从起点往终点方向执行
/// reverse    从终点往起点反方向执行
/// completed  到达动画终点处

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

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
        duration: const Duration(milliseconds: 2000),
        vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      // Dart 级联符号：A..B   使用 A 的返回值调用 B
      ..addListener(() {
        // 调用 setState()  每次动画生成一个新数字时，会标记当前帧为 dirty，这样会导致 build() 方法再次被调用
        setState(() {
          //
        });
      })
      ..addStatusListener((status) {
        print("$status");
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
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
