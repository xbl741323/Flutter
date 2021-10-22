import 'package:flutter/material.dart';
import 'package:flutter_study/states/global.dart';
import 'package:flutter_study/states/global_notifier.dart';
import 'package:flutter_study/views/account/account.dart';
import 'package:flutter_study/views/flukit_ui/flukit_ui.dart';
import 'package:flutter_study/views/login/login.dart';
import 'package:flutter_study/views/network/network.dart';
import 'package:flutter_study/views/setting/setting.dart';
import 'package:flutter_study/views/state_manage/state_manage.dart';
import 'package:flutter_study/views/style/style.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'components/tabbar_item.dart';

// void main() => Global.init().then((e) => runApp(MyApp()));
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //解决加载json错误
  Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: LoginModel()),
        ],
        child: OKToast(
          child: MaterialApp(
            debugShowCheckedModeBanner: true, //控制右上角debug显隐
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: MyHomePage(title: 'Flutter深度学习'),
          ),
        ));
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
  viewToast(title) {
    showToast('${title}',
        radius: 5,
        backgroundColor: Colors.black54,
        textPadding: EdgeInsets.all(12));
  }

  toAccont() {
    if (Global.loginFlag) {
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (ctx) => Account()));
    } else {
      toLogin();
    }
  }

  toMy() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (ctx) => Setting()));
  }

  toLogin() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (ctx) => Login()));
  }

  exit() {
    viewToast('退出成功！');
    Global.loginFlag = false;
    Global.savePreference('loginFlag', false);
    toLogin();
  }

  @override
  Widget build(BuildContext context) {
    return getMainBody();
  }

  Widget getMainBody() {
    LoginModel loginModel = Provider.of<LoginModel>(context);
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: getInfo()),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('账户信息'),
                onTap: () => {toAccont()},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('设置'),
                onTap: () => {toMy()},
              ),
              Global.loginFlag == true
                  ? ListTile(
                      leading: Icon(Icons.arrow_forward),
                      title: Text('退出'),
                      onTap: () => {exit()},
                    )
                  : Text(''),
            ],
          ),
        ),
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
            TabBarItem(Icon(Icons.api_sharp), "UI组件"),
            TabBarItem(Icon(Icons.backup_outlined), "状态管理"),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [Style(), Network(), Flukit_ui(), StateManage()],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget getInfo() {
    LoginModel loginModel = Provider.of<LoginModel>(context);
    if (loginModel.loginFlag) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: ClipOval(
            child:
                Image.asset("assets/images/keqing.png", width: 80, height: 80),
          )),
          Text(
            '阿晴的主页',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: ClipOval(
            child: GestureDetector(
              child:
                  Image.asset("assets/images/ying.jpg", width: 80, height: 80),
              onTap: () => {toLogin()},
            ),
          )),
          GestureDetector(
            child: Text(
              '点击登录',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onTap: () => {toLogin()},
          )
        ],
      );
    }
  }
}
