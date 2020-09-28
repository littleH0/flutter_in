import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in/exerCountDown/countdownWidget.dart';
import 'package:flutter_in/exerCountDown/countdownVariables.dart';

/// 倒计时，优化版，不需要 rebuild 所有组件
/// 传入总时长，到期时间，中间可以暂停，可以刷新到期时间

class Demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试 倒计时(优化版)",
      home: TestCountdownWidget(),
    );
  }
}

class TestCountdownWidget extends StatefulWidget {
  @override
  _TestCountdownWidgetState createState() => _TestCountdownWidgetState();
}

class _TestCountdownWidgetState extends State<TestCountdownWidget>
    with SingleTickerProviderStateMixin, GlobalVars {
  // 总时长,单位：分钟
  int totalMinute = 30;
  // 时间是否是暂停状态
  bool timePause = false;
  // GlobalVars instance = GlobalVars();
  Map houseTime = GlobalVars.houseTime;

  @override
  void initState() {
    super.initState();
    // 初始时间传入
    initTime();
    print(houseTime);
  }

  // 初始时间传入
  void initTime() {
    houseTime["endTime"] =
        DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch;
    houseTime["hours"] = totalMinute ~/ 60;
    if (houseTime["hours"] > 0) {
      houseTime["hours"]--;
      houseTime["minutes"] = 59;
    } else {
      houseTime["hours"] = 0;
      houseTime["minutes"] = totalMinute - 1;
    }
    houseTime["seconds"] = 59;
    houseTime["remainTime"] = formatTime(houseTime["hours"]);
    houseTime["remainTime"] += (":${formatTime(houseTime["minutes"])}:");
    houseTime["remainTime"] += formatTime(houseTime["seconds"]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("TestTimerWidgetState  build");
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 倒计时独立成widget"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          timePause ? Text("${houseTime["remainTime"]}") : CountDown(),
          FlatButton(
            onPressed: () {
              print("开始或暂停");
              // 添加上这句代表比原来时间增加30s,只有要开始了才增加
              if (!timePause) houseTime["endTime"] += 30 * 1000;
              timePause = !timePause;
              setState(() {});
            },
            child: Text(timePause ? "开始" : "暂停"),
          )
        ],
      )),
    );
  }
}
