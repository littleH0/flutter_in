import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试  transform",
      home: TestTransform(),
    );
  }
}

class TestTransform extends StatefulWidget {
  @override
  State<TestTransform> createState() {
    return _TestTransformState();
  }
}

class _TestTransformState extends State<TestTransform>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> _animation1;
  AnimationController _controller;
  CurvedAnimation curve;
  String imgpath = "assets/images/back.png";
  String imgpath1 = "assets/images/before.png";
  // double angle1 = 0.0;
  // double angle2 = pi / 2;    每增加 pi/2  多转一圈
  double angle1 = 0.0;
  double angle2 = pi / 2; // 3*pi / 2;
  bool aniFlag;
  bool aniFlag1;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(milliseconds: 400), vsync: this);
    curve = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    aniFlag = false;
    aniFlag1 = false;
    animation1();
    // animation2();
  }

  // 图片翻转动画
  void animation1() {
    _animation = Tween(begin: angle1, end: angle2).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            aniFlag = true;
          });
          _controller.reverse();
        }
      });
    _controller.forward();
  }

  void animation2() {
    // _controller.reset();
    _animation1 = Tween(begin: 0.0, end: pi).animate(curve)
      ..addListener(() {
        setState(() {
          if (_animation1.value == (pi / 2)) {
            aniFlag1 = true;
          }
        });
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
          title: Text("测试 transform"),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Transform(
                transform: Matrix4.rotationY(pi / 4), // 2/i完全竖着  pi/2 -> pi
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/before.png",
                  width: 100,
                  height: 100,
                ),
              ),
              Transform(
                transform: Matrix4.rotationY(-pi / 3), //
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/before.png",
                  width: 100,
                  height: 100,
                ),
              ),
              Transform(
                transform: Matrix4.rotationY(_animation.value),
                alignment: Alignment.center,
                child: Image.asset(
                  aniFlag == false ? imgpath : imgpath1,
                  width: 100,
                  height: 100,
                ),
              ),
              // Transform(
              //   transform: Matrix4.rotationY(_animation1.value),
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     aniFlag1 == false ? imgpath : imgpath1,
              //     width: 100,
              //     height: 100,
              //   ),
              // ),
              Image.asset(
                "assets/images/before.png",
                width: 100,
                height: 100,
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      aniFlag = !aniFlag;
                      aniFlag1 = !aniFlag1;
                      animation1();
                      // animation2();
                    });
                  },
                  color: Colors.white,
                  child: Text(
                    "点击转动",
                  ))
            ],
          ),
        ));
  }
}
