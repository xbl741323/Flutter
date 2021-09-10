import 'package:flutter/material.dart';

class Json extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json序列化"),
      ),
      body: Center(
        child: Text(
          "Json序列化",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
