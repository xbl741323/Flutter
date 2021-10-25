import 'package:flutter/material.dart';
import 'package:flutter_study/components/common/area_select/city_select.dart';
import 'package:flutter_study/components/common/back_to_top/example.dart';
import 'package:flutter_study/components/common/cached_image/cached_img_example.dart';
import 'package:flutter_study/components/common/city_picker/city_pick.dart';
import 'package:flutter_study/components/common/extended_image/extended_image_example.dart';
import 'package:flutter_study/components/common/image_picker/image_picker.dart';
import 'package:flutter_study/components/common/loading/loading.dart';
import 'package:flutter_study/components/common/photo_view/photo_view.dart';
import 'package:flutter_study/components/common/rating_bar/rating_bar.dart';
import 'package:flutter_study/components/common/swipper/swiper_page.dart';
import 'package:flutter_study/components/common/other_picker/other_picker.dart';
import 'package:flutter_study/components/common/toast/toast.dart';

class Flukit_ui extends StatelessWidget {
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);
  List<String> strItems = <String>[
    '地区选择器',
    '轮播图',
    'CityPickers',
    '其它选择器',
    'Image Picker',
    'Toast',
    '回到顶部',
    'Loading',
    'RatingBar星级评价',
    'cached_network_image缓存图片',
    'extended_image官方图片扩展库',
    'photo_view图片预览'
  ];

  List<Widget> mainList = [
    city_select(),
    swiper_page(),
    city_picker(),
    other_picker(),
    image_picker(),
    ToastUi(),
    ToTop(),
    loading_example(),
    rating_bar_example(),
    cached_image_example(),
    extended_image_example(),
    photo_view_example()
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
