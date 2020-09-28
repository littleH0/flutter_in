import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in/exerCountDown/countdownVariables.dart';

/// 倒计时组件，每次只刷新这一个组件
/// 和调用组件一起需要用到 countdownVariables.dart 里面的变量

class CountDown extends StatefulWidget {
  CountDownState createState() => CountDownState();
}

class CountDownState extends State<CountDown>
    with SingleTickerProviderStateMixin, GlobalVars {
  Timer remainTimer;
  Map houseTime = GlobalVars.houseTime;

  @override
  void initState() {
    super.initState();
    calTime();
  }

  // 参数是结束时间
  void calTime() {
    print(houseTime["endTime"]);
    remainTimer = Timer.periodic(Duration(seconds: 1), (a) {
      if ((houseTime["endTime"] - DateTime.now().millisecondsSinceEpoch) < 1) {
        remainTimer.cancel();
        remainTimer = null;
      }
      if (houseTime["seconds"] > 0)
        houseTime["seconds"]--;
      else {
        if (houseTime["minutes"] > 0)
          houseTime["minutes"]--;
        else {
          houseTime["hours"]--;
          houseTime["minutes"] = 59;
        }
        houseTime["seconds"] = 59;
      }
      houseTime["remainTime"] = formatTime(houseTime["hours"]);
      houseTime["remainTime"] += (":${formatTime(houseTime["minutes"])}:");
      houseTime["remainTime"] += formatTime(houseTime["seconds"]);
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (remainTimer != null) {
      remainTimer.cancel();
      remainTimer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("${houseTime["remainTime"]}");
  }
}
