import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 scaleTransition",
      home: TestScaleTransition(),
    );
  }
}

class TestScaleTransition extends StatefulWidget {
  @override
  _TestScaleTransitionState createState() => _TestScaleTransitionState();
}

class _TestScaleTransitionState extends State<TestScaleTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 scaleTransition"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            // 设置动画缩放中心
            alignment: Alignment.center,
            // 动画控制器
            scale: _scaleController,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xff074A97),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              _scaleController.reset();
              _scaleController.forward();
            },
            child: Text("点击变化"),
          )
        ],
      )),
    );
  }
}
