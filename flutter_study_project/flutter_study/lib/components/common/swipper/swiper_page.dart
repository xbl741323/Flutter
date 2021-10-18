import 'package:flutter/material.dart';

// 引入轮播图插件
import 'package:flutter_swiper/flutter_swiper.dart';

class swiper_page extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<swiper_page> {
  // 轮播图片
  List<Map> imageList = [
    {"url": "assets/images/one.jpg"},
    {"url": "assets/images/two.jpg"},
    {"url": "assets/images/three.jpg"},
    {"url": "assets/images/four.jpg"},
    {"url": "assets/images/five.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        // 配置宽高比
        aspectRatio: 16 / 9,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            // 配置图片地址
            return Image.asset(
              imageList[index]["url"],
              height: 200,
              fit: BoxFit.fill,
            );
          },
          // 配置图片数量
          itemCount: imageList.length,
          // 底部分页器
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  activeColor: Color.fromRGBO(255, 255, 255, 1),
                  size: 6.0,
                  activeSize: 6.0)),
          // 左右箭头
          // control: new SwiperControl(),
          // 无限循环
          loop: true,
          // 自动轮播
          autoplay: true,
        ),
      ),
    );
  }
}
