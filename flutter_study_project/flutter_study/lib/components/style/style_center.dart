import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_center extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Center"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return getBody(); // 封装MovieItem样式组件
              }),
        ));
  }

  Widget getBody() {
    return Text('一个将其子项置于自身中心的小部件。');
  }
}
