import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cached_image_example extends StatefulWidget {
  @override
  cached_image_example_state createState() => cached_image_example_state();
}

// ignore: camel_case_types
class cached_image_example_state extends State<cached_image_example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cached_network_image缓存图片'),
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
                '在某些情况下，在从网上下载图片后缓存图片可能会很方便，以便它们可以脱机使用。为此，我们可以使用cached_network_image包来达到目的。除了缓存之外，cached_image_network包在加载时还支持占位符和淡入淡出图片！'),
          ),
          CachedNetworkImage(
              placeholder: (context, url) =>
                  Image.asset('assets/images/keqing.png'),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/keqing.png'),
              imageUrl:
                  'http://static.wotao.com/icon/head/fa1bcfd31e02443aa00ab58df8007e2a.jpg')
        ],
      ),
    );
  }
}
