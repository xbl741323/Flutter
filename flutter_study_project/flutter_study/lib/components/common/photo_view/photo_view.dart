import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/components/common/photo_view/photo_solo_preview.dart';
import 'package:photo_view/photo_view.dart';

// ignore: camel_case_types
class photo_view_example extends StatefulWidget {
  @override
  photo_view_example_state createState() => photo_view_example_state();
}

// ignore: camel_case_types
class photo_view_example_state extends State<photo_view_example> {
  var img = 'assets/images/keqing.png';
  toPreview(img) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PhotoViewSimpleScreen(
              imageProvider: AssetImage(img),
              heroTag: 'simple',
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('photo_view图片预览'),
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
                'Flutter 的一个简单的可缩放图像/内容小部件。 PhotoView 使图像能够通过用户手势（例如捏合、旋转和拖动）进行缩放和平移。它还可以显示任何小部件而不是图像，例如容器、文本或 SVG。尽管使用起来非常简单，但 PhotoView 的选项和控制器却是非常可定制的。'),
          ),
          Container(
              width: double.infinity,
              child: GestureDetector(
                child: Image.asset("${img}"),
                onTap: () => toPreview(img),
              ))
        ],
      ),
    );
  }
}
