import 'package:flutter/material.dart';
import 'package:flutter_study/views/account/account.dart';

class style_checkbox extends StatefulWidget {
  @override
  style_checkbox_state createState() => style_checkbox_state();
}

// ignore: camel_case_types
class style_checkbox_state extends State<style_checkbox> {
  bool status = false;
  List idList = [];
  List<CheckBoxModel> industryData = [
    CheckBoxModel(201, '行业不限', false),
    CheckBoxModel(16, 'A农林牧渔', false),
    CheckBoxModel(17, 'B采矿业', false),
    CheckBoxModel(18, 'C制造业', false)
  ];

  getIndustry() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (_, setBottomSheetState) {
            return ListView.builder(
                itemCount: industryData.length,
                itemBuilder: (context, index) {
                  return getBody(industryData[index], setBottomSheetState);
                });
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBox'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                    'Flutter底部弹出框showModalBottomSheet不使用状态管理插件实现动态改变数据回调,解决CheckBox状态不更新的问题！'),
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  child: Text(
                    "点我一下",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => {getIndustry()},
                ),
              )
            ],
          ),
        ));
  }

  Widget getBody(CheckBoxModel item, setBottomSheetState) {
    return Container(
        child: Row(
      children: [
        Checkbox(
            value: item.status,
            onChanged: (value) {
              print(value);
              setBottomSheetState(() {
                idList = [];
                item.status = value;
                industryData.forEach((item) {
                  print(item.name);
                  print(item.status);
                  if (item.status == true) {
                    idList.add(item.id);
                  }
                });
                print(idList);
              });
            }),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("${item.name}"),
        ),
      ],
    ));
  }
}
