import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:images_picker/images_picker.dart';

// ignore: camel_case_types
class image_picker extends StatefulWidget {
  @override
  image_picker_state createState() => image_picker_state();
}

class image_picker_state extends State<image_picker> {
  /// 图片文件
  File _image;

  /// 实例化选择图片
  final ImagePicker picker = new ImagePicker();

  /// 存放获取到的本地路径
  /// 异步吊起相机拍摄新照片方法
  Future _getCameraImage() async {
    final cameraImages = await picker.pickImage(source: ImageSource.camera);
    if (mounted) {
      setState(() {
        //拍摄照片不为空
        if (cameraImages != null) {
          _image = File(cameraImages.path);
          print('你选择的路径是：${_image.toString()}');
          //图片为空
        } else {
          print('没有照片可以选择');
        }
      });
    }
  }

  Future _getImage() async {
    //选择相册
    final pickerImages = await picker.pickImage(source: ImageSource.gallery);
    if (mounted) {
      setState(() {
        if (pickerImages != null) {
          _image = File(pickerImages.path);
          print('你选择的本地路径是：${_image.toString()}');
        } else {
          print('没有照片可以选择');
        }
      });
    }
  }

  Future getImage() async {
    List<Media> res = await ImagesPicker.pick(
        count: 1, // 最大可选择数量
        pickType: PickType.image, // 选择媒体类型，默认图片
        cropOpt: CropOption(
            aspectRatio: CropAspectRatio.custom, cropType: CropType.circle));
    setState(() {
      print(res[0].path);
      _image = File(res[0].path);
    });
  }

  Future getCamera() async {
    List<Media> res = await ImagesPicker.openCamera(
      pickType: PickType.image,
    ); // 选择媒体类型，默认图片
    setState(() {
      print(res[0].path);
      _image = File(res[0].path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return getBody(); // 封装MovieItem样式组件
              }),
        ));
  }

  Widget getBody() {
    return Column(
      children: [
        Container(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            child: Text(
              "打开相册image_picker",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => {print('打开相册image_picker'), _getImage()},
          ),
        ),
        Container(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            child: Text(
              "打开照相机image_picker",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => {print('打开照相机image_picker'), _getCameraImage()},
          ),
        ),
        Container(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            child: Text(
              "打开相册images_picker",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => {print('打开相册images_picker'), getImage()},
          ),
        ),
        Container(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            child: Text(
              "打开照相机images_picker",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => {print('打开照相机images_picker'), getCamera()},
          ),
        ),
        Container(
            width: 200,
            height: 200,
            child: _image == null
                ? Text('没有选择任何图片')
                : ClipOval(
                    child: Image.file(
                      _image,
                      fit: BoxFit.fill,
                    ),
                  ))
      ],
    );
  }
}
