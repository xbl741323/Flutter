import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_wrap extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_wrap> {

  var list = new List.filled(10, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wrap"),
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
        Text('在多个水平或垂直运行中显示其子项的小部件。'
            '甲裹勾画出每个子并尝试放置由下式给出相邻于主轴线的前一个子子，方向，留下间隔 之间的空间。如果没有足够的空间容纳子项，Wrap 会在横轴中与现有子项相邻的位置创建一个新运行。'
            '将所有子项分配给运行后，运行中的子项将根据主轴中的对齐方式和交叉轴中的crossAxisAlignment进行定位。'
            '然后根据runSpacing和runAlignment将运行本身定位在交叉轴上。'),
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: list.map((e) => getImageItem()).toList(),
          ),
        )
      ],
    );
  }

  Widget getImageItem() {
    return Container(
      width: 120,
      child: Image.asset("assets/images/one.jpg"),
    );
  }
}
