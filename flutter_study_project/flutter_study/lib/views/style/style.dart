import 'package:flutter/material.dart';
import 'package:flutter_study/components/style/style_align.dart';
import 'package:flutter_study/components/style/style_center.dart';
import 'package:flutter_study/components/style/style_container.dart';
import 'package:flutter_study/components/style/style_expanded.dart';
import 'package:flutter_study/components/style/style_listview.dart';
import 'package:flutter_study/components/style/style_row_and_column.dart';
import 'package:flutter_study/components/style/style_stack.dart';
import 'package:flutter_study/components/style/style_text.dart';
import 'package:flutter_study/components/style/style_wrap.dart';

class Style extends StatelessWidget {
  List<String> strItems = <String>[
    'Widget（小部件） -> Text',
    'Widget（小部件） -> Row,Column',
    'Widget（小部件） -> Stack',
    'Widget（小部件） -> Container',
    'Widget（小部件） -> Center',
    'Widget（小部件） -> Align',
    'Widget（小部件） -> Expanded',
    'Widget（小部件） -> ListView',
    'Widget（小部件） -> Wrap',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("样式"),
        ),
        body: getBody());
  }

  Widget getBody() {
    return Container(
      child: ListView.separated(
        itemCount: strItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0, color: Colors.red);
        },
        itemBuilder: (context, index) {
          return buildListData(
              context, strItems[index], index);
        },
      ),
    );
  }

  // 封装
  Widget buildListData(
      BuildContext context, String strItem, index) {
      return new ListTile(
        isThreeLine: false,
        leading: new Icon(Icons.auto_awesome, color: Colors.red),
        title: new Text(strItem),
        trailing: new Icon(Icons.keyboard_arrow_right, color: Colors.red),
        onTap: () {
          switch (index) {
            case 0:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_text()));
              break;
            case 1:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_row_and_colum()));
              break;
            case 2:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_stack()));
              break;
            case 3:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_container()));
              break;
            case 4:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_center()));
              break;
            case 5:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_align()));
              break;
            case 6:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_expanded()));
              break;
            case 7:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_listview()));
              break;
            case 8:
              Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => style_wrap()));
              break;
          }
        });
  }
}
