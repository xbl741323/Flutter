import 'package:flutter/cupertino.dart';

import 'global.dart';

class LoginModel extends ChangeNotifier {
  bool get loginFlag => Global.loginFlag;
  int get count => Global.count;
  @override
  void notifyListeners() {
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
