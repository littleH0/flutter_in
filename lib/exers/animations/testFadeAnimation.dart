import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 FadeAnimation",
      home: GoogleFadeTransition(),
    );
  }
}

class GoogleFadeTransition extends StatefulWidget {
  @override
  _GoogleFadeTransitionState createState() => new _GoogleFadeTransitionState();
}

class _GoogleFadeTransitionState extends State<GoogleFadeTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  Widget build(BuildContext context) {
    print("build-----");
    _controller.forward();
    return FadeTransition(
      child: Container(
        color: Colors.red,
        width: 200.0,
        height: 200.0,
      ),
      opacity: _animation,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
