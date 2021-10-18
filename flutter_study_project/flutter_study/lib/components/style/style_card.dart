import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_card extends StatefulWidget {
  @override
  style_card_state createState() => style_card_state();
}

class style_card_state extends State<style_card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Card"),
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
      children: [
        Text('在Flutter中，Card具有圆角和阴影，这使它有一个3D效果。更改Card的elevation属性允许您控制投影效果。'),
        Card(
          margin: EdgeInsets.only(top: 10),
          shadowColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)), // 设置圆角大小
          ),
          elevation: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/one.jpg"),
              Container(
                padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 10),
                child: Text("PS魈KV_1920x1200"),
              )
            ],
          ),
        )
      ],
    );
  }
}
