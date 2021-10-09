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
          switch (index) {
            case 0:
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (ctx) => style_text()));
              break;
            case 1:
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (ctx) => style_row_and_colum()));
              break;
            case 2:
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (ctx) => style_stack()));
              break;
            case 3:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_container()));
              break;
            case 4:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_center()));
              break;
            case 5:
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (ctx) => style_align()));
              break;
            case 6:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_expanded()));
              break;
            case 7:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_listview()));
              break;
            case 8:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_gridview()));
              break;
            case 9:
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (ctx) => style_wrap()));
              break;
            case 10:
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (ctx) => style_card()));
              break;
            case 11:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_transform()));
              break;
            case 12:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_page_view()));
              break;
            case 13:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_tabBar_view()));
              break;
            case 14:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_clipoval()));
              break;
            case 15:
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (ctx) => style_animate_container()));
              break;
          }
        });
  }
}
