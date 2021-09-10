import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_expanded extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_expanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expanded"),
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
    return Text(
        '扩展Row、Column或Flex 的子级以便子级填充可用空间的小部件。'
        '使用Expanded小部件可以使Row、Column或Flex 的子项 扩展以填充沿主轴的可用空间（例如，水平用于Row或垂直用于Column）。如果扩展了多个子项，则根据弹性系数在它们之间分配可用空间。'
    );
  }
}
