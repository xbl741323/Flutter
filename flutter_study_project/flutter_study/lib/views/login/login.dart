import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/api/api_login.dart';
import 'package:flutter_study/main.dart';
import 'package:flutter_study/states/global.dart';
import 'package:flutter_study/views/my/my.dart';
import 'package:flutter_study/views/state_manage/state_manage.dart';

class Login extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<Login> {
  FocusNode blankNode = FocusNode();
  String phone;
  String password;
  GlobalKey<FormState> formGlobalKey = GlobalKey(); // 给form表单创建key值

  userLogin() {
    if(phone != ''&&password != ''){
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
      this.changeLoginFlag(true);
      if(Global.loginFlag){
        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => MyApp()));
      }
    }
  }

  changeLoginFlag(status){
    Global.loginFlag = status;
    Global.savePreference('loginFlag',status);
    print(Global.loginFlag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登录页"),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
              margin: EdgeInsets.only(top: 140),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [getDesc(), getForm()],
              )),
          onTap: () {
            // 点击空白页面关闭键盘
            FocusScope.of(context).requestFocus(blankNode);
          },
        ));
  }

  Widget getDesc() {
    return Container(
      child: Text('欢迎登录Flutter测试页',
          style: TextStyle(color: Colors.red, fontSize: 20)),
    );
  }

  // 登录表单
  Widget getForm() {
    return Form(
      key: formGlobalKey,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                labelText: "手机号",
                hintText: "请输入您的手机号",
                hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 12),
              ),
              onSaved: (value) => {this.phone = value},
              validator: (value) {
                if (value == '') {
                  return "请输入手机号";
                }
                return null;
              },
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "密码",
                hintText: "请输入您的密码",
                hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 12),
              ),
              onSaved: (value) => {this.password = value},
              validator: (value) {
                if (value == '') {
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
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () => {
                      formGlobalKey.currentState.save(),
                      formGlobalKey.currentState.validate(),
                      this.userLogin()
                    },
                style: ButtonStyle()),
          )
        ],
      ),
    );
  }
}
