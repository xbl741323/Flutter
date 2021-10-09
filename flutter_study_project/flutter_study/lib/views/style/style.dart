import 'package:flutter/material.dart';
import 'package:flutter_study/components/style/style_align.dart';
import 'package:flutter_study/components/style/style_animate_container.dart';
import 'package:flutter_study/components/style/style_card.dart';
import 'package:flutter_study/components/style/style_center.dart';
import 'package:flutter_study/components/style/style_clipoval.dart';
import 'package:flutter_study/components/style/style_container.dart';
import 'package:flutter_study/components/style/style_expanded.dart';
import 'package:flutter_study/components/style/style_gridview.dart';
import 'package:flutter_study/components/style/style_listview.dart';
import 'package:flutter_study/components/style/style_pageview.dart';
import 'package:flutter_study/components/style/style_row_and_column.dart';
import 'package:flutter_study/components/style/style_stack.dart';
import 'package:flutter_study/components/style/style_tabbarview.dart';
import 'package:flutter_study/components/style/style_text.dart';
import 'package:flutter_study/components/style/style_transform.dart';
import 'package:flutter_study/components/style/style_wrap.dart';

class Style extends StatelessWidget {
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);
  List<String> strItems = <String>[
    'Widget  ->  Text',
    'Widget  ->  Row,Column',
    'Widget  ->  Stack',
    'Widget  ->  Container',
    'Widget  ->  Center',
    'Widget  ->  Align',
    'Widget  ->  Expanded',
    'Widget  ->  ListView',
    'Widget  ->  GridView',
    'Widget  ->  Wrap',
    'Widget  ->  Card',
    'Widget  ->  Transform',
    'Widget  ->  PageView',
    'Widget  ->  TabBarView',
    'Widget  ->  ClipOval',
    'Widget  ->  AnimatedContainer',
  ];

  List<Widget> mainList = [
    style_text(),
    style_row_and_colum(),
    style_stack(),
    style_container(),
    style_center(),
    style_align(),
    style_expanded(),
    style_listview(),
    style_gridview(),
    style_wrap(),
    style_card(),
    style_transform(),
    style_page_view(),
    style_tabBar_view(),
    style_clipoval(),
    style_animate_container()
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
