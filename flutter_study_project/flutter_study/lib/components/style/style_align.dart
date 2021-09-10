import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_align extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_align> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Align"),
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
    return Text('Align小部件可将其子项与其自身对齐，并可选择根据子项的大小调整自身大小，还可以和stack一起使用精确定位。');
  }
}
