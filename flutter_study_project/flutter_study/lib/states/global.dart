//存储全局变量+状态跨组件共享
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static int count = 0;
  static bool loginFlag = false; // 登录状态

  //初始化全局信息，会在APP启动时执行
  static Future init() async {}

  //存储全局变量loginFlag
  static saveLoginFlag() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("loginFlag", loginFlag);
  }

  //获取全局变量loginFlag
  static Future<bool> getLoginFlag() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('loginFlag');
  }

  //存储全局变量count
  static saveCount() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("count", count);
  }

  //获取全局变量count
  static Future<int> getCount() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt('count');
  }
}
