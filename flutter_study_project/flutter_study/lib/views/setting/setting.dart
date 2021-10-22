import 'package:flutter/material.dart';
import 'package:flutter_study/main.dart';
import 'package:flutter_study/states/global_notifier.dart';
import 'package:flutter_study/views/login/login.dart';
import 'package:flutter_study/states/global.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool loginFlag = false;
  String title = '去登录';

  changeLoginFlag(status) {
    Global.loginFlag = status;
    Global.savePreference('loginFlag', status);
    print(Global.loginFlag);
  }

  skip() {
    setState(() {
      if (loginFlag) {
        loginFlag = false;
      }
    });
    this.changeLoginFlag(loginFlag);
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (ctx) => Login()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("设置"),
        ),
        body: getMyBody());
  }

  Widget getMyBody() {
    LoginModel loginModel = Provider.of<LoginModel>(context);
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Consumer<LoginModel>(
              builder: (context, loginModel, Widget child) {
            return Text(
              "${loginModel.loginFlag == false ? '去登录' : '退出'}",
              style: TextStyle(color: Colors.white),
            );
          }),
        ),
        onTap: () => this.skip(),
      ),
    );
  }
}
