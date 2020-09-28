import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// 并行动画
/// Curves 类定义常用动画曲线的数组，可以通过 CurvedAnimation 使用

/// 本例将基于【监视动画过程】的例子进行构建，该例使用 AnimatedWidget 循环的进行放大和缩小，
/// 考虑如何 再 添加一个再透明和不透明之间循环的动画

/// 该例展示了如何再同一个动画控制器上使用多个 Tween, 其中每个 Tween 管理动画中的不同效果，
/// 这里是示例，若在生产环境中需要使用不透明度和大小变化的 Tween 可能会使用 Fade Transition 和 Size Transition

/// 每个动画管理一个效果，eg:
//final AnimationController controller = new AnimationController(duration:new Duration(milliseconds: 2000),vsync: this);
//final Animation<double> sizeAnimation = new Tween(begin: 0.0,end:300.0).animate(controller);
//final Animation<double> opacityAnimation = new Tween(begin: 0.0,end: 1.0).animate(controller);
/// 可以通过 sizeAnimation.value 来获取大小，通过 opacityAniamtion.value 来获取不透明度
/// 但 AnimationWidget 的构造函数只接受一个动画对象，
/// 为了解决以上问题，该例创建了自己的 Tween 对象并显式计算了这些值
/// 其 build 方法 .evaluate() 在父级的动画对象上调用 Tween 函数以计算所需的 size 和 opacity 值
///

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.0, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  _BaseAniState createState() => _BaseAniState();
}

class _BaseAniState extends State<Demo> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
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
    return new AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
