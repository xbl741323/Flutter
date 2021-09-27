import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_page_view extends StatefulWidget {
  @override
  style_page_view_state createState() => style_page_view_state();
}

class style_page_view_state extends State<style_page_view> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PageView"),
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
        Text('PageView 是一个非常重要的组件，因为在移动端开发中很常用，比如大多数 App 都包含 Tab 换页效果、图片轮动以及抖音上下滑页切换视频功能等等，这些都可以通过 PageView 轻松实现。'),
        Container(
          margin: EdgeInsets.only(top:10),
          height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: PageView.builder(
              itemCount: 10000,
              itemBuilder: (context,index){
                return getPageItem((index)%3+1);
              }
          )
        )
      ],
    );
  }

  Widget getPageItem(index) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text(
        '${index}',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
