import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试  局部刷新",
      home: ScopeRefresh(),
    );
  }
}

/// 测试局部刷新， GlobalKey()  setState位置不同，刷新的组件都有哪些

class ScopeRefresh extends StatefulWidget {
  @override
  State<ScopeRefresh> createState() => _ScopeRefreshState();
}

class _ScopeRefreshState extends State<ScopeRefresh> {
  GlobalKey<_TextWidgetState> animationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build-build-build-build-build-1111111111111111111");
    return Scaffold(
        appBar: AppBar(
          title: Text("测试动画刷新"),
        ),
        body: temp());
  }

  double countNum = 19.0;
  bool isShow = true;
  Widget temp() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isShow = !isShow;
              countNum++;
            });
          },
          child: textWidget("string", "111111111111111"),
        ),
        // isShow ? TextWidget(animationKey,countNum):SizedBox(),
        isShow ? TextWidget(countNum) : SizedBox(),
      ],
    );
  }

  Widget textWidget(string, printS) {
    print("$printS");
    return InkWell(
      child: Text(string),
    );
  }
}

class TextWidget extends StatefulWidget {
  // final Key key;
  final double startNum;
  // const TextWidget(this.key,this.startNum);
  const TextWidget(this.startNum);
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    print(widget.startNum);
    play();
  }

  void play() {
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween(begin: widget.startNum, end: 20.0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print("build-build-build-build-build-222222222222222");
    return FlatButton(
        onPressed: () {
          // play();
        },
        child:
            textWidget("${animation.value.toStringAsFixed(1)}", "2222222222"));
  }

  Widget textWidget(string, printS) {
    print("$printS");
    return InkWell(
      child: Text(string),
    );
  }

  @override
  void dispose() {
    print("dispose==============");
    super.dispose();
  }
}
