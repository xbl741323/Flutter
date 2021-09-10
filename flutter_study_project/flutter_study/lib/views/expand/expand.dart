import 'package:flutter/material.dart';

class Expand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拓展"),
      ),
      body: Center(
        child: Text(
          "拓展",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
