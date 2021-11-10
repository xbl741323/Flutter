import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class style_scroll extends StatefulWidget {
  @override
  style_scroll_state createState() => style_scroll_state();
}

// ignore: camel_case_types
class style_scroll_state extends State<style_scroll> {
  var cIndex = 0;
  var list = ['影视', '番剧', '电影', '游戏', '原神', '幻塔', '国产', '科技', '动画', '新闻'];

  changeIndex(index) {
    print(index);
    this.setState(() {
      cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义scroll'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return getItem(index);
            }));
  }

  Widget getItem(index) {
    return InkWell(
      child: Container(
          width: 50,
          height: 30,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color:
                          cIndex == index ? Colors.deepPurple : Colors.white))),
          child: Text(
            '${list[index]}',
            textAlign: TextAlign.center,
          )),
      onTap: () => changeIndex(index),
    );
  }
}
