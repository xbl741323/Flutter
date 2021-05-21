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
            Text(
              '《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻神马，谁怕？一蓑烟雨任平生。谁怕？一蓑烟雨任平生。谁怕？一蓑烟雨任平生。谁怕？一蓑烟雨任平生。',
              style: TextStyle(color: Colors.deepPurpleAccent),
              textAlign: TextAlign.center,
              maxLines: 2, //控制显示几行，
              overflow: TextOverflow.ellipsis,
            ),
            Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "定风波",style: TextStyle(color: Colors.red)),
                    TextSpan(text: "定风波",style: TextStyle(color: Colors.red)),
                    TextSpan(text: "定风波",style: TextStyle(color: Colors.red))
                  ]
                ),
                  textAlign: TextAlign.center,
            ),
            ElevatedButton(
                child: Text("按钮"),
                onPressed: ()=>{},
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)), // 设置文本样式，这里设置颜色不起作用
                    backgroundColor: MaterialStateProperty.all(Colors.red), // 设置按钮背景颜色
                    foregroundColor: MaterialStateProperty.all(Colors.yellow), // 设置文本字体颜色
                    side:MaterialStateProperty.all(BorderSide(color: Colors.blue, width: 1)), // 设置按钮边框border颜色和宽度，外边框装饰 会覆盖 side 配置的样式
                    shape: MaterialStateProperty.all(StadiumBorder()), // 设置按钮的边框 相当于vue 中 borderRadius
                ),
            ),
            TextButton(
                child: Row(
                  children: [
                    Icon(Icons.access_alarm_rounded,size: 20.0,color: Colors.red,), // 设置图标
                    Text("按钮")
                  ],
                ),
                onPressed: ()=>{}
                ),
            OutlinedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_alarm_rounded,size: 20.0,color: Colors.red,), // 设置图标
                    Text("按钮")
                  ],
                ),
                onPressed: ()=>{}
                ),
            FloatingActionButton(
                child: Text("按钮"),
                onPressed: ()=>{}
                ),
            // Image.network('https://static-tst.wotao.com/property/label/3308715414e842f8afc69432a912b50e.jpg'),
            Image.asset("assets/images/img01.jpg"), // 引用本地图片
            ClipOval( // 设置圆形图片
              child:  Image.asset(
                  "assets/images/img04.jpg",
                width: 100,
                height: 100,
                fit:  BoxFit.cover,
              ),
            ),
            ClipRRect( // 设置相当于borerRadius
              borderRadius: BorderRadius.circular(20),
              child:  Image.asset(
                "assets/images/img02.jpg",
                width: 100,
                height: 200,
                fit:  BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  // labelText:"用户名",
                  hintText:"请输入用户名",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide()
                  ),
                  ),
                onChanged:(value)=>{
                  print('输出当前值'+'$value')
                } ,
                onSubmitted:(value)=>{
                  print('提交当前值'+'$value')
                },
              ), // form表单输入框
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText:"密码",
                  hintText:"请输入密码",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide()
                ),
                  filled: true,
                  fillColor: Colors.deepPurpleAccent
                ),
              ), // form表单输入框
            ),
            Form( // form表单
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.people),
                      hintText: "请输入用户名"
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        hintText: "请输入密码"
                    ),
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

