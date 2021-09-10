import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_container extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_container> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Container"),
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
    return Text('该Container小部件可让您创建矩形视觉元素。容器可以用 装饰BoxDecoration，例如背景、边框或阴影。AContainer还可以对其大小应用边距、填充和约束。此外， Container可以使用矩阵在三维空间中变换 a。');
  }
}
