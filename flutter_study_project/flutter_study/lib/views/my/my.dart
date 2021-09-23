import 'package:flutter/material.dart';
import 'package:flutter_study/states/global_notifier.dart';
import 'package:flutter_study/views/login/login.dart';
import 'package:flutter_study/states/global.dart';
import 'package:provider/provider.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  bool loginFlag = false;
  String title = '去登录';

  changeLoginFlag(status){
    Global.loginFlag = status;
    Global.savePreference('loginFlag',status);
  }

  skip(){
    setState(() {
        loginFlag = !loginFlag;
    });
    this.changeLoginFlag(loginFlag);
    print(Global.loginFlag);
    // Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => Login()));
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
        title: Text("我的"),
      ),
      body: getMyBody()
    );
  }

  Widget getMyBody(){
    LoginModel loginModel = Provider.of<LoginModel>(context);
    if(loginModel.loginFlag){
      return Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Consumer<LoginModel>(
              builder: (context,loginModel,Widget child) =>Text(
                  '${loginModel.loginFlag}'
              ),
            ),
          ),
          onTap: () => this.skip(),
        ),
      );
    }else{
      return Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Consumer<LoginModel>(
              builder: (context,loginModel,Widget child) =>Text(
                  '${loginModel.loginFlag}'
              ),
            ),
          ),
          onTap: () => this.skip(),
        ),
      );
    }
  }
}
