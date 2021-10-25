import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class extended_image_example extends StatefulWidget {
  @override
  extended_image_example_state createState() => extended_image_example_state();
}

// ignore: camel_case_types
class extended_image_example_state extends State<extended_image_example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('extended_image官方图片扩展库'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
                '一个强大的官方图片扩展库，支持占位符（加载）/失败状态、缓存网络、缩放平移图像、照片视图、滑出页面、编辑器（裁剪、旋转、翻转）、油漆自定义等。'),
          ),
          ExtendedImage.network(
            'http://static.wotao.com/icon/head/fa1bcfd31e02443aa00ab58df8007e2a.jpg',
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return GestureConfig(
                minScale: 0.9,
                animationMinScale: 0.7,
                maxScale: 3.0,
                animationMaxScale: 3.5,
                speed: 1.0,
                inertialSpeed: 100.0,
                initialScale: 1.0,
                inPageView: false,
                initialAlignment: InitialAlignment.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
