import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 位置和大小同时变化动画",
      home: TestPositionAndSizeAni(),
    );
  }
}

class TestPositionAndSizeAni extends StatefulWidget {
  @override
  _TestPositionAndSizeAniState createState() => _TestPositionAndSizeAniState();
}

class _TestPositionAndSizeAniState extends State<TestPositionAndSizeAni>
    with TickerProviderStateMixin {
  AnimationController aniController;
  Animation<RelativeRect> positionAni;
  CurvedAnimation curve;
  Animation<double> sizeAni;
  Animation _animation;

  @override
  void initState() {
    aniController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    curve = CurvedAnimation(parent: aniController, curve: Curves.easeIn);
    positionAni = RelativeRectTween(
            // begin: RelativeRect.fromLTRB(60, 50, 30, 50),
            // end: RelativeRect.fromLTRB(30, 50, 60, 50)
            //   begin: RelativeRect.fromLTRB(60, 50, 40, 50),
            //   end: RelativeRect.fromLTRB(40, 60, 60, 60)
            // 半径 50
            //
            begin: RelativeRect.fromLTRB(200, 150, 100, 150),
            end: RelativeRect.fromLTRB(50, 100, 150, 100))
        .animate(aniController);
    // sizeAni = Tween(
    //   begin: 0.0,
    //   end: 100.0,
    // ).animate(aniController);

    // _animation = TweenSequence([
    //     TweenSequenceItem(tween: RelativeRectTween(
    //         begin: RelativeRect.fromLTRB(60, 50, 30, 50),
    //         end: RelativeRect.fromLTRB(30, 50, 60, 50)
    //     ).chain(CurveTween(curve: Curves.easeIn)),weight: 10),
    //     TweenSequenceItem(tween: Tween(
    //       begin: 0.0,
    //       end: 100.0,
    //     ).chain(CurveTween(curve: Curves.easeIn)),weight: 10),
    //   ]).animate(aniController);

    aniController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("测试 位置和大小同时变化动画")),
      body: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(color: Colors.lightBlue),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: positionAni,
              builder: (BuildContext ctx1, Widget c1) {
                // PositionedTransition  弄清楚再用
                return PositionedTransition(
                  rect: positionAni,
                  // top: positionAni.value.top,
                  // left: positionAni.value.left,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  // child: AnimatedBuilder(
                  //   animation: sizeAni,
                  //   builder:(BuildContext ctx2,Widget c2){
                  //     return Container(
                  //       width: sizeAni.value,
                  //       height: sizeAni.value,
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //         borderRadius: BorderRadius.circular(100),
                  //       ),
                  //       // child: InkWell(
                  //       //   onTap: (){
                  //       //     print("点击事件  未生效");
                  //       //     // aniController.reset();
                  //       //     aniController.forward();
                  //       //   },
                  //       //   child: Text("点击运行",style: TextStyle(color: Colors.yellow),),
                  //       // ),
                  //     );
                  //   }
                  // )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
