import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 AnimatedBuilder",
      home: TestAnimatedBuilder(),
    );
  }
}

class TestAnimatedBuilder extends StatefulWidget {
  @override
  _TestAnimatedBuilderState createState() => _TestAnimatedBuilderState();
}

class _TestAnimatedBuilderState extends State<TestAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    // 2.动画添加Curve效果
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.elasticInOut,
        reverseCurve: Curves.easeOut);
    // 3.监听动画
    // 4.控制动画的翻转
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    // 5.设置值的范围
    animation = Tween(begin: 50.0, end: 120.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 这里只会重建一次
    print("外围   build()");
    return Center(
        child: Column(
      children: [
        Text("${animation.value}"),
        AnimatedBuilder(
          animation: animation,
          builder: (ctx, child) {
            // 这里会随着动画刷新
            print("AnimatedBuilder    build()");
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: animation.value,
            );
          },
        ),
      ],
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
