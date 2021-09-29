import 'package:flutter/material.dart';
import 'package:flutter_study/states/global.dart';
import 'package:flutter_study/states/global_notifier.dart';
import 'package:flutter_study/views/json/json.dart';
import 'package:flutter_study/views/login/login.dart';
import 'package:flutter_study/views/my/my.dart';
import 'package:flutter_study/views/network/network.dart';
import 'package:flutter_study/views/state_manage/state_manage.dart';
import 'package:flutter_study/views/style/style.dart';
import 'package:provider/provider.dart';
import 'components/tabbar_item.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true, //控制右上角debug显隐
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHomePage(title: 'Flutter深度学习'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return getMainBody();
  }

  Widget getMainBody(){
    LoginModel loginModel = Provider.of<LoginModel>(context);
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 12, // 设置不选中时的字体大小
            selectedFontSize: 12, // 设置选中时的字体大小
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              TabBarItem(Icon(Icons.whatshot_outlined), "样式"),
              TabBarItem(Icon(Icons.add_to_queue_sharp), "Http"),
              TabBarItem(Icon(Icons.api_sharp), "JSON序列化"),
              TabBarItem(Icon(Icons.backup_outlined), "状态管理"),
              TabBarItem(Icon(Icons.account_circle), "我的")
            ],
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: [Style(), Network(), Json(), StateManage(), My()],
          ) // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
