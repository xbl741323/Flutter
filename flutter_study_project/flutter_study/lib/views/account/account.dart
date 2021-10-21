import 'dart:ffi';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/components/common/other_picker/PickerTool.dart';
import 'package:flutter_study/views/account/ItemUpdate.dart';

class Account extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  List idList = [];
  List<CheckBoxModel> industryData = [
    CheckBoxModel(201, '行业不限', false),
    CheckBoxModel(16, 'A农林牧渔', false),
    CheckBoxModel(17, 'B采矿业', false),
    CheckBoxModel(18, 'C制造业', false)
  ];

  List<dynamic> strItems = <dynamic>[
    {'name': '账户类型', 'cValue': '', 'cId': ''},
    {'name': '单位logo', 'cValue': '', 'cId': ''},
    {'name': '单位名称', 'cValue': '', 'cId': ''},
    {'name': '单位类型', 'cValue': '', 'cId': ''},
    {'name': '行业类型', 'cValue': '', 'cId': ''},
    {'name': '所在地区', 'cValue': '', 'cId': ''},
    {'name': '详细地址', 'cValue': '', 'cId': ''},
    {'name': '上一年销售额', 'cValue': '', 'cId': ''},
    {'name': '专利数量', 'cValue': '', 'cId': ''},
    {'name': '单位人数', 'cValue': '', 'cId': ''},
    {'name': '联系人', 'cValue': '', 'cId': ''},
    {'name': '手机号码', 'cValue': '', 'cId': ''},
    {'name': '职务', 'cValue': '', 'cId': ''}
  ];

  /// 账户类型
  List accountTypeName = ["单位", "个人"];
  List accountType = [
    {'id': 1, 'name': "单位"},
    {'id': 0, 'name': "个人"},
  ];

  /// 单位类型
  List unitTypeName = ["企业", "事业单位", "高校", "政府"];
  List unitType = [
    {'id': 19, 'name': "企业"},
    {'id': 21, 'name': "事业单位"},
    {'id': 20, 'name': "高校"},
    {'id': 22, 'name': "政府"}
  ];

  /// 行业类型
  List industryName = ["行业不限", "A农林牧渔", "B采矿业", "C制造业"];
  List industry = [
    {'id': 201, 'name': "行业不限"},
    {'id': 16, 'name': "A农林牧渔"},
    {'id': 17, 'name': "B采矿业"},
    {'id': 18, 'name': "C制造业"}
  ];

  /// 销售额
  List salesName = ["2000万以下", "2000-4999万", "5000万-2亿", "2亿以上"];
  List sales = [
    {'id': 23, 'name': "2000万以下"},
    {'id': 25, 'name': "2000-4999万"},
    {'id': 26, 'name': "5000万-2亿"},
    {'id': 27, 'name': "2亿以上"}
  ];

  /// 单位人数
  List unitEmpName = ["99人及以下", "100-999人", "1000-2999人", "3000人及以上"];
  List unitEmp = [
    {'id': 24, 'name': "99人及以下"},
    {'id': 28, 'name': "100-999人"},
    {'id': 29, 'name': "1000-2999人"},
    {'id': 30, 'name': "3000人及以上"}
  ];

  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);

  showSelect(val, pIndex) {
    if (pIndex == 0 || pIndex == 3 || pIndex == 7 || pIndex == 9) {
      PickerTool.showStringPicker(context,
          data: filterClassifyName(pIndex),
          normalIndex: 0,
          title: val['name'], clickCallBack: (int index, var str) {
        setState(() {
          setClassValue(pIndex, filterClassify(pIndex, index));
        });
      });
    } else if (pIndex == 5) {
      getAreaWidget();
    } else if (pIndex == 1) {
    } else if (pIndex == 4) {
      getIndustrySelect(pIndex);
    } else {
      Navigator.of(context).push(
          new MaterialPageRoute(builder: (ctx) => ItemUpdate(index: pIndex)));
    }
  }

  getIndustrySelect(pIndex) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (_, setBottomSheetState) {
            return Container(
              padding: EdgeInsets.only(top: 2, bottom: 5),
              height: 300,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 12),
                    decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200])),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 5),
                            child: GestureDetector(
                              child: Text(
                                '取消',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF323232)),
                              ),
                              onTap: () => {Navigator.pop(context)},
                            )),
                        Container(
                          child: Text(
                            '行业类型',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF323232)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 15, top: 5),
                            child: GestureDetector(
                              child: Text(
                                '确定',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF323232)),
                              ),
                              onTap: () => {Navigator.pop(context)},
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 220,
                    child: ListView.builder(
                        itemCount: industryData.length,
                        itemBuilder: (context, index) {
                          return getItemCheckbox(
                              industryData[index], setBottomSheetState, pIndex);
                        }),
                  )
                ],
              ),
            );
          });
        });
  }

  /// CheckBox复选框
  Widget getItemCheckbox(CheckBoxModel item, setBottomSheetState, pIndex) {
    return Container(
      height: 20,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Checkbox(
              value: item.status,
              onChanged: (value) {
                setBottomSheetState(() {
                  var nameList = [];
                  item.status = value;
                  idList = [];
                  industryData.forEach((element) {
                    if (element.status) {
                      idList.add(element.id);
                      nameList.add(element.name);
                    }
                  });
                  setState(() {
                    strItems[pIndex]['cValue'] = nameList.join('/');
                  });
                  print(idList);
                  print(strItems[pIndex]['cValue']);
                });
              }),
          Text("${item.name}")
        ],
      ),
    );
  }

  getAreaWidget() async {
    Result result = await CityPickers.showCityPicker(
        context: context,
        height: 250,
        cancelWidget: Text(
          "取消",
          style: TextStyle(color: Colors.black),
        ),
        confirmWidget: Text(
          "确定",
          style: TextStyle(color: Colors.black),
        ));
    print(result);
    setState(() {
      strItems[5]['cValue'] =
          "${result.provinceName}/${result.cityName}/${result.areaName}";
    });
  }

  setClassValue(index, val) {
    setState(() {
      strItems[index]['cValue'] = val['name'];
      strItems[index]['cId'] = val['id'].toString();
      print(strItems[index]);
    });
  }

  filterClassify(pIndex, index) {
    switch (pIndex) {
      case 0:
        return accountType[index];
      case 3:
        return unitType[index];
      case 4:
        return industry[index];
      case 7:
        return sales[index];
      case 9:
        return unitEmp[index];
    }
  }

  filterClassifyName(index) {
    switch (index) {
      case 0:
        return accountTypeName;
      case 3:
        return unitTypeName;
      case 4:
        return industryName;
      case 7:
        return salesName;
      case 9:
        return unitEmpName;
    }
  }

  filterName(index) {
    var title = "请输入";
    if (index == 0 || index == 3 || index == 4 || index == 7 || index == 9) {
      title = "请选择";
    }
    return strItems[index]['cValue'] != '' ? strItems[index]['cValue'] : title;
  }

  @override
  void initState() {
    // TODO: implement initState
    print("初始化！");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账户信息"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView.separated(
        itemCount: strItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0, color: Colors.deepPurple);
        },
        controller: _controller,
        itemBuilder: (context, index) {
          return buildListItem(context, strItems[index], index);
        },
      ),
    );
  }

  /// 返回单条样式
  Widget buildListItem(BuildContext context, dynamic item, index) {
    return GestureDetector(
        child: Container(
          height: index == 1 ? 70 : 50,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Text("*",
                        style: TextStyle(color: Colors.red, fontSize: 16)),
                    Container(
                      margin: EdgeInsets.only(left: 7),
                      child: Text(item['name'],
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ),
                  ],
                ),
              ),
              getSelectAndImg(item, index)
            ],
          ),
        ),
        onTap: () => showSelect(item, index));
  }

  /// 返回选择框和头像
  Widget getSelectAndImg(dynamic item, index) {
    return Container(
      child: index == 1
          ? Container(
              padding: EdgeInsets.only(top: 1, bottom: 1, right: 10),
              child: ClipOval(
                child: Image.asset('assets/images/keqing.png'),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: Text(filterName(index),
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, right: 3, top: 2),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                )
              ],
            ),
    );
  }
}

class CheckBoxModel extends Object {
  int id;
  String name;
  bool status;

  CheckBoxModel(this.id, this.name, this.status);
  CheckBoxModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'status': status};
}
