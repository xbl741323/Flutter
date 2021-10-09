import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_clipoval extends StatefulWidget {
  @override
  style_clipoval_state createState() => style_clipoval_state();
}

class style_clipoval_state extends State<style_clipoval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ClipOval"),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ClipOval：如果 child 为正方形时剪裁之后是圆形，如果 child 为矩形时，剪裁之后为椭圆形'),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ClipOval(
            child: getImageItem(),
          ),
        ),
        Text('ClipRect：将 child 剪裁为给定的矩形大小'),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ClipRect(
            child: getImageItem(),
          ),
        ),
        Text('ClipRRect：将 child 剪裁为圆角矩形'),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: getImageItem(),
            )),
      ],
    );
  }

  Widget getImageItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Image.asset(
        "assets/images/one.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
