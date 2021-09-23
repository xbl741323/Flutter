//存储全局变量+状态跨组件共享
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static int count = 0;
  static bool loginFlag = false; // 登录状态

  //初始化全局信息，会在APP启动时执行
  static Future init() async {}

  // 单一存储全局变量loginFlag
  static saveLoginFlag() async {
    //SharedPreferences用于存储数据
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("loginFlag", loginFlag);
  }

  // 单一获取全局变量loginFlag
  static Future<bool> getLoginFlag() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('loginFlag');
  }

  //（统一和单一存取数据建议：存储model（json对象）可以选择单一存储，存储前可以先将model对象转换为String类型的数据，再进行存储,基本类型数据可以选择统一封装存储）

  // 统一封装存数据
  static Object savePreference(String key, Object value) async {
    _prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is List) {
      await _prefs.setStringList(key, value);
    } else {
      throw new Exception("不能得到这种类型");
    }
  }

  // 统一封装取数据
  static Future getPreference(String key, String type) async {
    _prefs = await SharedPreferences.getInstance();
    if (type == 'int') {
      return  _prefs.getInt(key);
    } else if (type == 'double') {
      return  _prefs.getDouble(key);
    } else if (type == 'bool') {
      return  _prefs.getBool(key);
    } else if (type == 'String') {
      return  _prefs.getString(key);
    } else if (type == 'List') {
      return  _prefs.getStringList(key);
    } else {
      throw new Exception("不能得到这种类型");
    }
  }

  // 统一封装删除指定数据
  static void remove(String key) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.remove(key); //删除指定键
  }

  // 清空整个缓存
  static void clear() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear(); ////清空缓存
  }
}
