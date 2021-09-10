import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_listview extends StatefulWidget {
  @override
  style_text_state createState() => style_text_state();
}

class style_text_state extends State<style_listview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
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
        'ListView是最常用的滚动小部件。它在滚动方向上一个接一个地显示其子项。在横轴中，子项需要填充ListView。'
        '构建ListView有四个选项：默认构造函数采用显式List<Widget>子项。此构造函数适用于具有少量子级的列表视图，因为构造List需要为每个可能显示在列表视图中的子级而不是仅实际可见的子级进行工作。'
        '该ListView.builder构造函数采用IndexedWidgetBuilder，它建立在孩子的需求。此构造函数适用于具有大量（或无限）子项的列表视图，因为仅针对那些实际可见的子项调用构建器。'
        '该ListView.separated构造函数有两个IndexedWidgetBuilder S： itemBuilder按需建立个子项目，separatorBuilder 同样建立其出现在子项之间的分隔符的孩子。此构造函数适用于具有固定子项数量的列表视图。'
        '该ListView.custom构造需要SliverChildDelegate，它提供了自定义子模型的其他方面的能力。例如，SliverChildDelegate可以控制用于估计实际上不可见的子项大小的算法。'
    );
  }
}
