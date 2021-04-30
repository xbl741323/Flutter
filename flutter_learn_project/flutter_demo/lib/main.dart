import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
/**
 * Widget:
 * 有状态的Widget: StatefulWidget 在运行过程中有一些状态(data)需要改变
 *  无状态的Widget: StatelessWidget 内容是确定没有状态(data)的改变
 */

class MyApp extends StatelessWidget {
  // 此小部件是应用程序的根
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //控制右上角debug显隐
      title: 'Flutter Demo',
      theme: ThemeData(
        // 这是应用程序的主题
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 学习项目'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding( // 设置padding的块件
        padding: EdgeInsets.all(10),
        child: ListView( //列表可下拉
          children: <Widget>[
            ProductItem("Apple1","Macbook Product1","https://static-tst.wotao.com/property/label/3308715414e842f8afc69432a912b50e.jpg"),
            ProductItem("Apple2","Macbook Product2","https://static-tst.wotao.com/property/label/3a16f409792149a4bad2f5d7f5341b1f.jpg"),
            ProductItem("Apple3","Macbook Product3","https://static-tst.wotao.com/property/label/bb4d03ed67c1447fbc6ae2974fb3d441.jpg"),
          ],
        ),

      ),
    );
  }
}
class ProductItem extends StatelessWidget{
  final String title;
  final String desc;
  final String imgSrc;

  ProductItem(this.title,this.desc,this.imgSrc);

  @override
  Widget build(BuildContext context) {
    return Container( //创建一个结合了常见绘制、定位和大小调整小部件的小部件。
      padding: EdgeInsets.all(2), //padding属性设置
      margin: EdgeInsets.only(top: 5), //margin属性设置
      decoration: BoxDecoration(
        border: Border.all(
          width: 3
        )
      ),
      child: Column(
          children: <Widget>[
            Text(title,style: TextStyle(fontSize:20),),
            Text(desc,style: TextStyle(fontSize: 16),),
            SizedBox(height: 10), //占领一定的间距的小块件
            Image.network(imgSrc),
          ],
      ),
    );
  }
}
