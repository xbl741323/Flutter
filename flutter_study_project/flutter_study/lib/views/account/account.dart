import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/components/common/other_picker/PickerTool.dart';
import 'package:flutter_study/views/account/ItemUpdate.dart';

class Account extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
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
  List salesName = ["2000万以下", "2000-4999万", "5000万-2亿", "C制造业"];
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
    if (pIndex == 0 ||
        pIndex == 3 ||
        pIndex == 4 ||
        pIndex == 7 ||
        pIndex == 9) {
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
    } else {
      Navigator.of(context).push(
          new MaterialPageRoute(builder: (ctx) => ItemUpdate(index: pIndex)));
    }
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
      strItems[5]['cValue'] = "${result.provinceName}/${result.cityName}/${result.areaName}";
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
                      child: Text(item['name'], style: TextStyle(fontSize: 16)),
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
                Text(filterName(index), style: TextStyle(fontSize: 16)),
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
