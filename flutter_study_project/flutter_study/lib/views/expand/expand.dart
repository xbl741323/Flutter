import 'package:flutter/material.dart';
import 'package:flutter_study/views/login/login.dart';

class Expand extends StatelessWidget {
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
            child: Text("去登录",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFFFFFFF))),
          ),
          onTap: () => Navigator.of(context)
              .push(new MaterialPageRoute(builder: (ctx) => Login())),
        ),
      ),
    );
  }
}
