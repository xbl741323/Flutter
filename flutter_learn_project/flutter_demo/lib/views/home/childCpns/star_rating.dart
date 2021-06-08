import 'package:flutter/material.dart';

class StarRating extends StatefulWidget { // 封装的评分组件
  final double rating; // 当前评分
  final double maxRating; // 最高评分
  final int count; // 星星个数
  final double size; // 星星大小
  final Color unselectColor; // 未选中时的颜色
  final Color selectColor; // 选中时的颜色

  StarRating({
    this.rating = 10,
    this.maxRating = 10,
    this.count = 5,
    this.size = 15,
    this.unselectColor = Colors.black26,
    this.selectColor = Colors.amber
});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack( // Stack布局-覆盖布局
      children: [
        getUnselectedStar(),
        getSelectedStar(),
      ],
    );
  }

  Widget getUnselectedStar(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (index) {
        return Icon(Icons.star,color: widget.unselectColor,size: widget.size,);
      }),
    );
  }

  Widget getSelectedStar(){
    // 1.单个星星的大小
    double oneValue = widget.maxRating/widget.count;
    // 2.计算完整的star
    int entireCount = (widget.rating/oneValue).floor();
    // 3.剩余的一个star显示的比例
    double ratioLeft = (widget.rating - entireCount*oneValue)/oneValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount+1, (index) {
        if(index<entireCount) return ClipRect(
          clipper: MyRectClipper(width: widget.size),
          child: Icon(Icons.star,color: widget.selectColor,size: widget.size),
        );
        return ClipRect(
          clipper: MyRectClipper(width: (widget.size)*ratioLeft),
          child: Icon(Icons.star,color: widget.selectColor,size: widget.size),
        );
      }),
    );
  }
}

class MyRectClipper extends CustomClipper<Rect> { // 制作剪切效果
  double width;
  MyRectClipper({this.width});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }

}
