import 'package:flutter/material.dart';
import 'package:flutter_demo/components/tabbar_item.dart';
import 'package:flutter_demo/views/home/home.dart';
import 'package:flutter_demo/views/classify/classify.dart';
import 'package:flutter_demo/views/movie/movie.dart';
import 'package:flutter_demo/views/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 此小部件是应用程序的根
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,  //控制右上角debug显隐
      title: 'Flutter Demo',
      theme: ThemeData(
        // 这是应用程序的主题
        primarySwatch: Colors.green, // 设置主题颜色
        highlightColor: Colors.transparent, // 设置点击高亮 transparent是透明
        splashColor: Colors.transparent // 设置点击水波纹效果透明
      ),
      home: MyHomePage(title: '豆瓣App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 此小部件是应用程序的主页
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0; // _属性名 一般代表私有属性

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar( // 设置头部栏
      //   title: Text(widget.title), //widget属性是state中自带的,就是MyHomePage
      //   centerTitle: true
      // ),
      bottomNavigationBar: BottomNavigationBar( // 设置底部tab栏
        // selectedItemColor: Colors.red, // 改变选中的tab栏颜色
        unselectedFontSize: 12, // 设置不选中时的字体大小
        selectedFontSize: 12, // 设置选中时的字体大小
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          TabBarItem("home", "主页"),
          TabBarItem("movie", "书影音"),
          TabBarItem("focus", "专区"),
          TabBarItem("my", "我的")
        ],
      ),
      body: IndexedStack(  // 设置tab分类展示
        index: _currentIndex,
        children: [
          Home(),
          Classify(),
          Movie(),
          Profile()
        ],
      )
    );
  }
}

