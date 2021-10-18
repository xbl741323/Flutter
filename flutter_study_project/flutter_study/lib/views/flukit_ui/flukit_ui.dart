import 'package:flutter/material.dart';
import 'package:flutter_study/components/common/area_select/city_select.dart';
import 'package:flutter_study/components/common/city_picker/city_pick.dart';
import 'package:flutter_study/components/common/swipper/swiper_page.dart';
import 'package:flutter_study/components/common/other_picker/other_picker.dart';


class Flukit_ui extends StatelessWidget {
  final ScrollController _controller =
  ScrollController(keepScrollOffset: false);
  List<String> strItems = <String>[
    '地区选择器',
    '轮播图',
    'CityPickers',
    '其它选择器',
  ];

  List<Widget> mainList = [
    city_select(),
    swiper_page(),
    city_picker(),
    other_picker()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flukit UI和其它UI组件"),
        ),
        body: getBody());
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
          return buildListData(context, strItems[index], index);
        },
      ),
    );
  }

  // 封装
  Widget buildListData(BuildContext context, String strItem, index) {
    return new ListTile(
        isThreeLine: false,
        leading: new Icon(Icons.auto_awesome, color: Colors.deepPurple),
        title: new Text(strItem),
        trailing:
        new Icon(Icons.keyboard_arrow_right, color: Colors.deepPurple),
        onTap: () {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (ctx) => mainList[index]));
        });
  }
}
