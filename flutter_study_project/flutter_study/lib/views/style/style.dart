
import 'package:flutter/material.dart';

class Style extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("样式"),
      ),
      body: Center(
        child: Text(
          "样式",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
  
}