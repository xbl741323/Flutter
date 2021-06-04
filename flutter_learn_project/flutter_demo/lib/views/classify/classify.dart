import 'package:flutter/material.dart';

class Classify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("专区"),
      ),
      body: Center(
        child: Text("专区",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
