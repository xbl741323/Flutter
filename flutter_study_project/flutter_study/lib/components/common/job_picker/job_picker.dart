import 'package:flutter/material.dart';

// ignore: camel_case_types
class job_picker extends StatefulWidget {
  @override
  job_picker_state createState() => job_picker_state();
}

class job_picker_state extends State<job_picker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("职业选择器"),
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
        Text('job_picker'),
      ],
    );
  }
}
