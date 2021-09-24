import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_transform extends StatefulWidget {
  @override
  style_transform_state createState() => style_transform_state();
}

class style_transform_state extends State<style_transform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transform"),
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
        Text('要旋转一个widget，将它嵌套在一个Transform中。 使设置其alignment和origin属性分别以相对和绝对值指定变换原点。对于简单的2D旋转，widget在Z轴上旋转。（度数×π/ 180）'),
        Transform(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            color: Colors.red,
            child: Image.asset("assets/images/one.jpg",width: 100,height: 100,fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          transform: new Matrix4.identity()
            ..rotateZ(45 * 3.1415927 / 180),
        )
      ],
    );
  }
}
