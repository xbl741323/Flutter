import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_row_and_colum extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_row_and_colum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row, Column"),
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
    return Text('这些 flex 小部件让您可以在水平 ( Row) 和垂直 ( Column) 方向上创建灵活的布局。这些对象的设计基于 web 的 flexbox 布局模型。');
  }
}
