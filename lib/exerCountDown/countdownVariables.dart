/// static  静态，单例，两个文件同时引入，一个文件修改，另一个文件可以拿到修改后的值，需要 类名.变量名 获取
/// 没有 static,一个引入会实例化一个，用 with 混入，可以直接取 变量名，或者手动实例化一个对象， 对象.变量名 获取

class GlobalVars {
  // 时间一：房间时间
  static Map houseTime = {
    "endTime": 0,
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "remainTime": "00:00:00"
  };

  // 时间二：留座时间   只有秒数，但可能对应不同用户的
  static List saveTimeList = List();
  // 或
  static Map saveTime = {
    "userId": 0,
    "seconds": 0,
  };

  String formatTime(int t) {
    return (t > 9) ? "$t" : "0$t";
  }
}
