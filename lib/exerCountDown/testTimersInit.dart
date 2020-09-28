import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 倒计时(初版)",
      home: TestCountDownInit(),
    );
  }
}

/// 初版，测试倒计时，
/// 初始传入 总倒计时时长和到期时间
/// 中间有暂停

class TestCountDownInit extends StatefulWidget {
  @override
  _TestCountDownInitState createState() => _TestCountDownInitState();
}

class _TestCountDownInitState extends State<TestCountDownInit>
    with SingleTickerProviderStateMixin {
  String timer = "00:00:00";
  String remainTime = "00:00:00";
  Timer _timer;
  Timer remainTimer;
  // 总时长
  int totalMinute = 30;
  // 到期时间（时间戳）
  int endTime;
  // 时间是否是暂停状态
  bool timePause = false;
  // 小时
  int remainHours = 0;
  // 分钟
  int remainMinutes = 0;
  // 秒
  int remainSeconds = 0;
  @override
  void initState() {
    super.initState();
    // 1.随当前时间变化
    _timer = Timer.periodic(Duration(milliseconds: 1), (a) {
      // 更新界面
      var now = DateTime.now();
      setState(() {
        timer = "${now.hour}:${now.minute}:${now.second}";
      });
    });

    // 初始时间传入
    initTime();
    // 2.房间总时长，单位：分钟，到期时间
    calTime(endTime);
  }

  // 初始时间传入
  void initTime() {
    var now = DateTime.now();
    endTime = now.add(Duration(minutes: 1)).millisecondsSinceEpoch;
    remainHours = totalMinute ~/ 60;
    if (remainHours > 0) {
      remainHours--;
      remainMinutes = 59;
      remainSeconds = 59;
    } else {
      remainHours = 0;
      remainMinutes = totalMinute - 1;
      remainSeconds = 59;
    }
  }

  // 参数是结束时间
  void calTime(endTime) {
    print(endTime);
    remainTimer = Timer.periodic(Duration(seconds: 1), (a) {
      if ((endTime - DateTime.now().millisecondsSinceEpoch) < 1) {
        remainTimer.cancel();
        remainTimer = null;
      }
      if (remainSeconds > 0)
        remainSeconds--;
      else {
        if (remainMinutes > 0)
          remainMinutes--;
        else {
          remainHours--;
          remainMinutes = 59;
        }
        remainSeconds = 59;
      }
      remainTime = temp(remainHours);
      remainTime += (":${temp(remainMinutes)}:");
      remainTime += temp(remainSeconds);
      setState(() {});
    });
  }

  // 判断位数
  String temp(int t) {
    if (t > 9)
      return "$t";
    else
      return "0$t";
  }

  @override
  void dispose() {
    if (remainTimer != null) {
      remainTimer.cancel();
      remainTimer = null;
    }
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 倒计时(初版)"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$timer"),
          Text("$remainTime"),
          FlatButton(
            onPressed: () {
              print("开始或暂停");
              if (timePause) {
                // 结束时间不变
                // calTime(endTime);
                // 结束时间在当前结束基础上加20S   秒和毫秒的换算是1000
                calTime(endTime + 20 * 1000);
              } else if (remainTimer != null) {
                remainTimer.cancel();
                remainTimer = null;
              }
              timePause = !timePause;
            },
            child: Text(timePause ? "开始" : "暂停"),
          )
        ],
      )),
    );
  }
}
