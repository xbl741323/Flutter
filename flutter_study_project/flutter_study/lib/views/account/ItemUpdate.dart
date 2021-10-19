import 'package:flutter/material.dart';
import 'package:flutter_study/views/account/account.dart';

class ItemUpdate extends StatefulWidget {
  final int index;
  ItemUpdate({Key key, @required this.index}) : super(key: key);

  @override
  ItemUpdateState createState() => ItemUpdateState();
}

class ItemUpdateState extends State<ItemUpdate> {
  var title = "";
  GlobalKey<FormState> itemUpdateKey = GlobalKey(); // 给form表单创建key值

  updateAccount() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (ctx) => Account()));
  }

  setOriginValue(index) {
    setState(() {
      switch (index) {
        case 2:
          title = '单位名称：';
          break;
        case 6:
          title = '详细地址：';
          break;
        case 8:
          title = '专利数量：';
          break;
        case 10:
          title = '联系人：';
          break;
        case 11:
          title = '手机号码：';
          break;
        case 12:
          title = '职务：';
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print(widget.index);
    setOriginValue(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账户修改"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Form(
        key: itemUpdateKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text("${title}"),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "请填写",
                  hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 12),
                ),
                onSaved: (value) => {},
                validator: (value) {
                  if (value.trim() == '') {
                    return "值不能为空";
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
                    "确认",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () => {
                        itemUpdateKey.currentState.save(),
                        itemUpdateKey.currentState.validate(),
                        updateAccount()
                      },
                  style: ButtonStyle()),
            )
          ],
        ),
      ),
    );
  }
}
