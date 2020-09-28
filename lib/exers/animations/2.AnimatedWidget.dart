

/// 使用 AnimatedWidget 助手类，而不是 addListener() 和 setState() 来给 widget 添加动画
/// 使用 AnimatedWidget 创建一个可重用动画的 widget  要从 widget 中分离出动画过渡  使用 AnimatedBuilder
/// Flutter API 提供的关于 AnimatedWidget 的示例包括：AnimatedBuilder  AnimatedModalBarrier  DecoratedBoxTransition
/// FadeTransition  PositionedTransition  RelativePositionedTransition
/// RotationTransition  ScaleTransition  SizeTransition  SlideTransition

/// AnimatedWidget 类允许 从 setState() 调用中的动画代码中分离出 widget代码。它不需要维护一个 State 对象来保存动画
/// 自动调用  addListener() 和 setState()

/// 下面示例中，Demo 现在继承自 AnimatedWidget 而不是 StatefulWidget
/// AnimatedWidget 在绘制时使用动画的当前值
/// Demo 仍然管理着 AnimatedController 和 Tween

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget{
  // 构造函数
  AnimatedLogo({Key key,Animation<double> animation}):super(key:key,listenable:animation);

  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    return new Center(
      child:new Container(
        margin: EdgeInsets.symmetric(vertical:10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
}

class Demo extends StatefulWidget{
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  initState(){
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 2000),vsync: this);
    animation = new Tween(begin: 0.0,end:300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
}