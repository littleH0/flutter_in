import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 int和double动画时刷新次数",
      home: IntAndDoubleAnimation(),
    );
  }
}

class IntAndDoubleAnimation extends StatefulWidget {
  @override
  _IntAndDoubleAnimationState createState() => new _IntAndDoubleAnimationState();
}

class _IntAndDoubleAnimationState extends State<IntAndDoubleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _doubleAnimation;
  Animation<int> _intAnimation;
  int totalCount = 0;
  @override
  Widget build(BuildContext context) {
    totalCount++;
    print("build-----$totalCount");
    return Scaffold(
      appBar: AppBar(
        title: Text('测试  int和double动画时刷新次数'),
      ),
      body: Container(
        width: 100,
        height: 100,
        child: InkWell(
          onTap: () {
            totalCount = 0;
            _controller.reset();
            _controller.forward();
          },
          child: Text("${_intAnimation.value}"),
          // return Text("${_intAnimation.value}");
          // return Text("${_doubleAnimation.value}");
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    // _doubleAnimation = Tween(
    //   begin: 1.0,
    //   end: 10.0,
    // ).animate(_controller)..addListener(() {
    //   setState(() {
    //   });
    // });
    _intAnimation = IntTween(
      begin: 1,
      end: 10,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    totalCount = 0;
    _controller.dispose();
    super.dispose();
  }

  // 结论，渲染次数一样多
}
