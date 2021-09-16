import 'package:flutter_study/network/http.dart';

// ignore: camel_case_types
class api_login {

  // 用户登录api
  static userLogin(Map<String,dynamic> params) {
    return Http.request(
        url: "uims/account/login",
        method: 'post',
        params: params
    );
  }

  // 获取测试信息
  static getTestData() {
    return Http.request(
        url: "policy/detail?number=XM20210525001&type=4&token=2",
        method: 'get'
    );
  }
}
