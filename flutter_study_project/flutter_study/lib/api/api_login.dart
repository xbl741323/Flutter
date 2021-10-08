import 'package:flutter_study/network/http.dart';

// ignore: camel_case_types
class api_login {

  // 用户登录api
  static userLogin(Map<String,dynamic> params) {
    return Http.request(
        url: "/uims/account/login",
        method: 'post',
        params: params
    );
  }

  // 获取登录用户信息
  static getUserInfo(){
    return Http.request(
      url: "/uims/account/info",
      method: 'get'
    );
  }

  // 获取知产列表信息
  static getTestData(Map<String,dynamic> params) {
    return Http.request(
        url: "/policy/index/list",
        method: 'post',
        params: params
    );
  }

  // 获取知产详情信息
  static getTestDetail(Map<String,dynamic> params) {
    return Http.request(
        url: "/policy/detail",
        method: 'get',
        params: params
    );
  }
}
