import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 transform.scale",
      home: TestTrnasformScale(),
    );
  }
}

class TestTrnasformScale extends StatefulWidget {
  @override
  State<TestTrnasformScale> createState() {
    return _TestTrnasformScaleState();
  }
}

class _TestTrnasformScaleState extends State<TestTrnasformScale>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  CurvedAnimation curve;

  double start = 0.0;
  double end = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(milliseconds: 400), vsync: this);
    curve = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    animation1();
  }

  // 图片翻转动画
  void animation1() {
    _animation = Tween(begin: start, end: end).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // _controller.reset();
          // _controller.forward();
          // _controller.reverse();
        }
      });
    _controller.forward();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试transform - scale"),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Transform.scale(
                scale: _animation.value,
                child: Image.asset(
                  "assets/images/before.png",
                  width: 100,
                  height: 100,
                ),
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _controller.reset();
                      animation1();
                    });
                  },
                  color: Colors.white,
                  child: Text(
                    "点击放大",
                  ))
            ],
          ),
        ));
  }
}
