import 'package:flutter/material.dart';
import 'package:flutter_study/components/flukit_ui/area_select/city_select.dart';

class Flukit_ui extends StatelessWidget {
  final ScrollController _controller =
  ScrollController(keepScrollOffset: false);
  List<String> strItems = <String>[
    '地区选择器',
  ];

  List<Widget> mainList = [
    city_select(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flukit UI"),
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
