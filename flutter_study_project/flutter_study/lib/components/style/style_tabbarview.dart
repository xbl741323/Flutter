import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_tabBar_view extends StatefulWidget {
  @override
  style_tabBar_state createState() => style_tabBar_state();
}

class style_tabBar_state extends State<style_tabBar_view> {
  final List<String> myTabs = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBarView"),
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: myTabs.map((e) => Tab(text: e)).toList()),
        ),
        body: TabBarView(children: myTabs.map((e) => homeItem(e)).toList()),
      ),
    );
  }

  Widget homeItem(title) {
    return Center(
      child: Container(
        child:
            Text('${title}', style: TextStyle(color: Colors.deepPurple, fontSize: 20)),
      ),
    );
  }
}
