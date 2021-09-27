import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_tabBar_view extends StatefulWidget {
  @override
  style_tabBar_state createState() => style_tabBar_state();
}

class style_tabBar_state extends State<style_tabBar_view> {
  List<String> tabs = ['甘雨', '刻晴', '胡桃'];
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBarView"),
          backgroundColor: Colors.red,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "电影",
              ),
              Tab(
                text: "电视",
              ),
              Tab(
                text: "综艺",
              ),
              Tab(
                text: "读书",
              ),
              Tab(
                text: "音乐",
              ),
              Tab(
                text: "同城",
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          homeItem('电影'),
          homeItem('电视'),
          homeItem('综艺'),
          homeItem('读书'),
          homeItem('音乐'),
          homeItem('同城'),
        ]),
      ),
    );
  }

  Widget homeItem(title) {
    return Center(
      child: Container(
        child: Text('${title}',style: TextStyle(color: Colors.red,fontSize: 20)),
      ),
    );
  }
}
