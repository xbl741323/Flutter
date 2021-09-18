import 'package:flutter/material.dart';
import 'package:flutter_study/views/login/login.dart';
import 'package:flutter_study/states/global.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  bool loginFlag = false;
  String title = '去登录';

  getLoginFlag() {
    Global.getLoginFlag().then((value) => {
          setState(() => {
                if (value != null)
                  {
                    loginFlag = value,
                    title = loginFlag == true?"退出":"去登录",
                    print(loginFlag)
                  }
              })
        });
  }

  changeLoginFlag(status){
    Global.loginFlag = status;
    Global.saveLoginFlag();
  }

  skip(){
    if(loginFlag){
      this.changeLoginFlag(false);
    }
    print(Global.loginFlag);
    Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => Login()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getLoginFlag();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFFFFFFF))),
          ),
          onTap: () => this.skip(),
        ),
      ),
    );
  }
}
