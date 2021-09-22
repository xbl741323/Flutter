import 'package:flutter/material.dart';
import 'package:flutter_study/states/global.dart';
import 'package:flutter_study/states/global_notifier.dart';
import 'package:provider/provider.dart';

class StateManage extends StatefulWidget {
  @override
  _StateManageState createState() => _StateManageState();
}

class _StateManageState extends State<StateManage> {
  FocusNode blankNode = FocusNode();
  GlobalKey<FormState> _formGlobalKey = GlobalKey(); // 给form表单创建key值
  int num = 0;
  int showNum = 0;
  changeCount() {
    Global.count = num;
    Global.saveCount();
    this.getCount();
    print(num);

  }

  getCount(){
    Global.getCount().then((value) => {
      setState(() => {
        if (value != null)
          {
            showNum = value,
          }
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("状态管理"),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: [getForm(), getGlobalCount()],
          ),
          onTap: () {
            // 点击空白页面关闭键盘
            FocusScope.of(context).requestFocus(blankNode);
          },
        ));
  }

  // 数字表单
  Widget getForm() {
    return Form(
      key: _formGlobalKey,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.anchor_sharp),
                hintText: "请输入一个数字",
                hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 12),
              ),
              keyboardType: TextInputType.number,
              onSaved: (value) => {
                if(value!=''){
                  this.num = int.parse(value)
                }else{
                  this.num = 0
                }
              },
              validator: (value) {
                if (value == '') {
                  return "请输入";
                }
                return null;
              },
            ),
          ),
          Container(
            // 可以设置按钮宽高
            width: double.infinity,
            height: 40,
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                child: Text(
                  "change",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () => {
                      _formGlobalKey.currentState.save(),
                      _formGlobalKey.currentState.validate(),
                      this.changeCount()
                    },
                style: ButtonStyle()),
          )
        ],
      ),
    );
  }

  // 显示共享变量count
  Widget getGlobalCount() {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Consumer<LoginModel>(
              builder: (context,loginModel,Widget child) =>Text('显示共享变量count：' + '${loginModel.count}',
                  style: TextStyle(color: Colors.red, fontSize: 30)),
            ),
            Consumer<LoginModel>(
               builder: (context,loginModel,Widget child) =>Text(
                 '${loginModel.loginFlag}'
               ),
             ),
          ],
        ));
  }
}
