import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_animate_container extends StatefulWidget {
  @override
  style_animate_container_state createState() =>
      style_animate_container_state();
}

class style_animate_container_state extends State<style_animate_container> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedContainer"),
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
        Text(
            'AnimatedContainer可以理解为Container Animat，也就是说带动画的容器，使用AnimatedContainer可以很方便的实现Widget的动画效果。'),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
              });
            },
            child: AnimatedContainer(
              curve: Curves.bounceInOut,
              //容器的高度
              height: click ? 200 : 100,
              //容器的宽度
              width: click ? 200 : 100,
              decoration: BoxDecoration(
                  //背景图片
                  image: DecorationImage(
                    //加载资源目录下的图片
                    image: AssetImage('assets/images/keqing.png'),
                    fit: BoxFit.cover,
                  ),
                  //圆角
                  borderRadius: BorderRadius.all(Radius.circular(
                    click ? 200 : 0,
                  ))),
              //过渡时间
              duration: Duration(milliseconds: 1500),
            ),
          ),
        )
      ],
    );
  }
}
