/// 用 AnimatedBuilder 重构
/// 1.AnimatedBuilder 了解如何渲染过渡
/// 2.一个 AnimatedBuilder不知道如何渲染 widget, 也不知道如何管理 Animation 对象
/// 3.使用 AnimatedBuilder 将动画描述为 另一个 widget 的 build 方法的一部分，如果只是想用可复用的动画定义一个 widget, 请使用 AnimatedWidget
/// 4.Flutter API 中 AnimatedBuilder 的示例包括：BottomSheet  ExpansionTile  PopupMenu  ProgressIndicator  RefreshIndicator
///                                            Scaffold  SnackBar  TabBar  TextField

/// 下面示例的 widget 树
/// Container
/// GrowTransition
/// AnimatedBuilder
/// (AnonymousBuilder)
/// LogoWidget

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

/// 该示例的 widget 树中中间三部分 都在 GrowTransition 的 builder() 方法中创建
/// GrowTransition 本身是无状态的，并拥有定义过渡动画所需的最终变量集合
/// build() 函数创建并返回 AnimationBuilder, 它将（匿名构建器）方法和 LogoWidget 作为参数
/// 渲染转换的工作实际上发生在（匿名构建器）方法中，该方法创建一个适当大小的 Container 来强制缩放 LogoWidget

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: new AnimatedBuilder(
        animation: animation,
        // 匿名构建器
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            // 图片显示，可以不重新 build 这部分
            child: child,
          );
        },
        // LogoWidget
        child: child,
      ),
    );
  }
}

/// 初始化动画的代码与 1.动画基础 中很相似，initState() 方法创建一个 AnimationController 和 Tween ， 然后通过 animate() 绑定他们
/// 魔术发生在 build() 方法中，该方法返回一个带有 LogoWidget 作为子对象的 GrowTransition 对象，以及一个用于驱动过渡的动画对象

class Demo extends StatefulWidget {
  _DemoState createState() => _DemoState();
}

// 不再是 SingleTickerProviderStateMixin
class _DemoState extends State<Demo> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new GrowTransition(
      child: new LogoWidget(),
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
