import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 timerUtils",
      home: TestTimerUtil(),
    );
  }
}

/// 测试 commonUtils 中的 timerUtil  做倒计时

class TestTimerUtil extends StatefulWidget {
  @override
  _TestTimerUtilState createState() => _TestTimerUtilState();
}

// 不是特别符合当前自己的需要
class _TestTimerUtilState extends State<TestTimerUtil>
    with SingleTickerProviderStateMixin {
  String remainTime = "0";
  // 倒计时实例
  TimerUtil timerCountDown;

  @override
  void initState() {
    super.initState();

    // mInterval 倒计时间隔，单位毫秒  mTotalTime 倒计时总时长，单位毫秒
    timerCountDown = TimerUtil(mInterval: 1000, mTotalTime: 30 * 1000);
    timerCountDown.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        remainTime = "$_tick";
      });
      if (_tick == 0) {
        print("做相应的操作");
      }
    });
    // 开始倒计时
    timerCountDown.startCountDown();
    // 重设倒计时总时间
    // timerCountDown.updateTotalTime(totalTime);
  }

  @override
  void dispose() {
    timerCountDown.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 timerUtils"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$remainTime"),
        ],
      )),
    );
  }
}
