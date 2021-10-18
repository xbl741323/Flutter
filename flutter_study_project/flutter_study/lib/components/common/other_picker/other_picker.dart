import 'dart:io';

import 'package:flutter/material.dart';

import 'PickerTool.dart';

// ignore: camel_case_types
class other_picker extends StatefulWidget {
  @override
  other_picker_state createState() => other_picker_state();
}

class other_picker_state extends State<other_picker> {
  var value = "";
  var value2 = "";
  var value3 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("其它选择器"),
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
      children: [getSoloPick(), getMultiPick(), getDatePick()],
    );
  }

  /// 单项选择器
  Widget getSoloPick() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(Icons.anchor_sharp, size: 17),
            Text('单项选择器'),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: value != "" ? Text('当前值：${value}') : Text("当前值：请选择"),
            )
          ],
        ),
      ),
      onTap: () => {
        PickerTool.showStringPicker(context,
            data: ["前端开发", "后端开发", "测试工程师", "架构师"],
            normalIndex: 0,
            title: "职业", clickCallBack: (int index, var str) {
          setState(() {
            value = str;
          });
          print(index);
          print(str);
        })
      },
    );
  }

  /// 多项选择器
  Widget getMultiPick() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(Icons.anchor_sharp, size: 17),
            Text('多项选择器'),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: value2 != "" ? Text('当前值：${value2}') : Text("当前值：请选择"),
            )
          ],
        ),
      ),
      onTap: () => {
        PickerTool.showArrayPicker(context,
            data: [
              ["前端开发", "后端开发", '测试工程师'],
              ["vue", "java", "phython"],
            ],
            title: "职业",
            normalIndex: [0, 0], clickCallBack: (var index, var strData) {
          setState(() {
            value2 = strData[0] + '/' + strData[1];
          });
          print(index);
          print(strData);
        })
      },
    );
  }

  /// 日期选择器
  Widget getDatePick() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(Icons.anchor_sharp, size: 17),
            Text('日期选择器'),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: value3 != "" ? Text('当前值：${value3}') : Text("当前值：请选择"),
            )
          ],
        ),
      ),
      onTap: () => {
        PickerTool.showDatePicker(context, title: "日期", value: DateTime.now(),
            clickCallback: (var str, var time) {
          setState(() {
            value3 = time;
          });
          print(str);
          print(time);
        })
      },
    );
  }
}
