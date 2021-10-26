import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

import 'city_model.dart';

// ignore: camel_case_types
class city_select extends StatefulWidget {
  @override
  city_select_state createState() => city_select_state();
}

// ignore: camel_case_types
class city_select_state extends State<city_select> {
  var currentCity = "安徽";
  List<CityModel> cityList = [];
  List<CityModel> _hotCityList = [];

  @override
  void initState() {
    super.initState();
    _hotCityList.add(CityModel(name: '安徽', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '江苏', tagIndex: '★'));
    cityList.addAll(_hotCityList);
    SuspensionUtil.setShowSuspensionStatus(cityList);

    Future.delayed(Duration(milliseconds: 100), () {
      loadData();
    });
  }

  editCity(name) {
    setState(() {
      currentCity = name;
    });
  }

  void loadData() async {
    //加载城市列表
    rootBundle.loadString('assets/data/china.json').then((value) {
      cityList.clear();
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      list.forEach((v) {
        cityList.add(CityModel.fromJson(v));
      });
      _handleList(cityList);
    });
  }

  void _handleList(List<CityModel> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(list);

    // add hotCityList.
    cityList.insertAll(0, _hotCityList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(cityList);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地区选择器"),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          header(),
          container(),
        ],
      )),
    );
  }

  Widget header() {
    return Container(
      color: Colors.white,
      height: 44.0,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            autofocus: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: InputBorder.none,
                labelStyle: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                hintText: '城市中文名或拼音',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFFCCCCCC))),
            onSubmitted: (value) => {editCity(value)},
          )),
          Container(
            width: 0.33,
            height: 14.0,
            color: Color(0xFFEFEFEF),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "取消",
                style: TextStyle(color: Color(0xFF999999), fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget container() {
    return Expanded(
      child: Material(
        color: Color(0x80000000),
        child: Card(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(left: 0, top: 5, right: 0),
          shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15.0),
                height: 50.0,
                child: Text("当前城市: ${currentCity}"),
              ),
              Expanded(
                child: AzListView(
                  data: cityList,
                  itemCount: cityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    CityModel model = cityList[index];
                    return ListTile(
                      title: Text(model.name),
                      onTap: () {
                        print(model);
                        print(model.name);
                        print(model.id);
                        editCity(model.name);
                      },
                    );
                    ;
                  },
                  padding: EdgeInsets.zero,
                  susItemBuilder: (BuildContext context, int index) {
                    CityModel model = cityList[index];
                    String tag = model.getSuspensionTag();
                    return getSusItem(context, tag);
                  },
                  indexBarData: ['★', ...kIndexBarData],
                  // indexBarData: [
                  //   ...[
                  //     'A',
                  //     'J',
                  //     'Q',
                  //   ]
                  // ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}
