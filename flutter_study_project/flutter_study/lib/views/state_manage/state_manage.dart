import 'package:flutter/material.dart';

class StateManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("状态管理"),
      ),
      body: Center(
        child: Text(
          "状态管理",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
