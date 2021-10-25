import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/api/api_login.dart';
import 'package:flutter_study/main.dart';
import 'package:flutter_study/states/global.dart';
import 'package:flutter_study/views/state_manage/state_manage.dart';
import 'package:flutter_study/views/style/style.dart';
import 'package:oktoast/oktoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<Login> {
  FocusNode blankNode = FocusNode();
  String phone = '17730078715';
  String password = '123456';
  GlobalKey<FormState> formGlobalKey = GlobalKey(); // 给form表单创建key值
  viewToast(title) {
    showToast('${title}',
        radius: 5,
        backgroundColor: Colors.black54,
        textPadding: EdgeInsets.all(12));
  }

  toHome() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (ctx) => MyApp()));
  }

  userLogin() {
    if (phone != '' && password != '') {
      var params = {
        'accountNo': "17730078715",
        'accountPassword': "0ae16aae193ee3e226e5d06db285aa7b",
        'accountSource': 1,
        'platFlag': "A",
        'securityCode': "",
        'terminalType': 0
      };
      // api_login.userLogin(params).then((res) {
      //   print(res);
      // });
      print(phone);
      print(password);
      print("点击了登录按钮！");
      if (phone == '17730078715' && password == '123456') {
        viewToast('登录成功！');
        this.changeLoginFlag(true);
        if (Global.loginFlag) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (ctx) => MyApp()));
        }
      } else {
        viewToast('账号或密码错误！');
      }
    }
  }

  changeLoginFlag(status) {
    Global.loginFlag = status;
    Global.savePreference('loginFlag', status);
    print(Global.loginFlag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getDesc(), getForm()],
            )),
      ),
      onTap: () {
        // 点击空白页面关闭键盘
        FocusScope.of(context).requestFocus(blankNode);
      },
    ));
  }

  Widget getDesc() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: 240,
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/two.jpg'))),
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 35),
            child: Text(
              '首页',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => {toHome()},
        ));
  }

  // 登录表单
  Widget getForm() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Form(
        key: formGlobalKey,
        child: Column(
          children: [
            Container(
              child: TextFormField(
                initialValue: phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: Colors.deepPurple.withOpacity(0.8),
                  ),
                  fillColor: Colors.deepPurple.withOpacity(0.8),
                  labelText: "手机号",
                  labelStyle:
                      TextStyle(color: Colors.deepPurple.withOpacity(0.8)),
                  hintText: "请输入您的手机号",
                  hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 12),
                ),
                onSaved: (value) => {this.phone = value},
                validator: (value) {
                  if (value.trim() == '') {
                    return "请输入手机号";
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: TextFormField(
                initialValue: password,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.deepPurple.withOpacity(0.8),
                  ),
                  labelText: "密码",
                  labelStyle:
                      TextStyle(color: Colors.deepPurple.withOpacity(0.8)),
                  hintText: "请输入您的密码",
                  hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 12),
                ),
                obscureText: true, // 密码显示加密
                onSaved: (value) => {this.password = value},
                validator: (value) {
                  if (value.trim() == '') {
                    return "请输入密码";
                  }
                  return null;
                },
              ),
            ),
            Container(
              // 可以设置按钮宽高
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => {
                        formGlobalKey.currentState.save(),
                        formGlobalKey.currentState.validate(),
                        this.userLogin()
                      },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Colors.deepPurple.withOpacity(0.8),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
