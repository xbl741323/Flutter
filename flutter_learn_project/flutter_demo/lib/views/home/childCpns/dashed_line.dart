import 'package:flutter/material.dart';

class Dashedline extends StatelessWidget { // 封装的虚线组件
   final Axis axis;
   final int count;
   final double dashedWidth;
   final double dashedHeight;
   final Color color;

   Dashedline({
     this.axis,
     this.count,
     this.dashedWidth = 1,
     this.dashedHeight = 1,
     this.color = const Color(0xff888888)
});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) { // 循环数组遍历
        return  Container(
          width: dashedWidth,
          height: dashedHeight,
          color: color
      );
      })
    );
  }
}
