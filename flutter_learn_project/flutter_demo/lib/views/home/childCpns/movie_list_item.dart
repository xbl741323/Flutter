import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';
import 'package:flutter_demo/views/home/childCpns/dashed_line.dart';
import 'package:flutter_demo/views/home/childCpns/movie_detail.dart';
import 'package:flutter_demo/views/home/childCpns/star_rating.dart';

class MovieListItem extends StatelessWidget {
  final MovieItem item; // 定义一个item属性

  MovieListItem(this.item);  // 定义构造函数

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 10,color: Color(0xffe2e2e2)), // 使用十六进制颜色
        )
      ),
      padding: EdgeInsets.all(10),
      child: new InkWell(
            onTap: (){
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) => new MovieDetail())
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getRankWidget(), // 将样式封装成方法调用展示
                getRowWidget(),
                getBottomWidget()
              ],
            ),
          )
    );
  }

  // 1.获取排名显示的Widget
  Widget getRankWidget(){
    return Container(
      width: 40,
      height: 23,
      alignment: Alignment.center,
      decoration: BoxDecoration( // 注意：这里color和decoration不能同时存在 decoration里面可以设置border相关样式
          color: Colors.orange[200],
          borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      margin: EdgeInsets.only(left:0,bottom:5),
      child: Text("No.1",style: TextStyle(color: Colors.brown)),
    );
  }

  // 2.获取row部分的Widget
  Widget getRowWidget(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getRowOne(),
          getRowTwo(),
          getRowThree(),
          getRowFour(),
        ]);
  }

  // 2.1 row部分one模块
  Widget getRowOne(){
    return Container(
        width: 100,
        height: 120,
        child: ClipRRect( // 这样可以设置图片圆角
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            "assets/images/home/movie.jpg",
            width: 100,
            height: 120,
            fit:  BoxFit.cover,
          ),
        )
    );
  }

  // 2.2 row部分two模块
  Widget getRowTwo(){
    return Expanded( // 除去两端剩余的部分，可以很好的兼容宽度自适应，做手机适配
      child: Container( // 这里的Container不要设置宽度，不然会影响手机适配
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/home/play.png",
                  width: 14,
                  height: 14,
                  fit:  BoxFit.cover,
                ),
                Text("肖申克的救赎",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                Text("(1994)",style: TextStyle(fontSize: 14),)
              ],),
            getRowRating(), // 评分模块
            Container(
              child: Text(
                "犯罪/剧情/弗兰克·德拉邦特/提姆·罗宾斯/摩根·富兰克林/本杰明·亚里士多德利亚",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 2.2.1 评分模块
  Widget getRowRating(){
    return Row(
      children: [
        StarRating(
          rating: 9.1,
          maxRating: 10,
          count: 5,
          size: 15,
          selectColor: Colors.amber,
          unselectColor: Colors.black26,
        ),
        Container(
            margin: EdgeInsets.only(left: 2),
            child: Text('9.1',style: TextStyle(color: Colors.black54),)),// 封装的评分组件
      ],
    );
  }

  // 2.3 row部分three模块,绘制虚线
  Widget getRowThree(){
    return Container(
      height: 80,
      margin: EdgeInsets.only(left: 5),
      child: Dashedline(
        axis: Axis.vertical,
        count: 14,
        dashedWidth: 1,
        dashedHeight: 3,
        color: Colors.black45,
      ),
    );
  }

  // 2.4 row部分four模块
  Widget getRowFour(){
    return Container( // Container可以解决居中问题
      width: 40,
      height: 80,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            "assets/images/home/collect.png",
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          Text("想看",style: TextStyle(color: Colors.amber,fontSize: 12),),
        ],
      ),
    );
  }

  // 3.获取底部显示的widget
  Widget getBottomWidget(){
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(left: 5),
      child: Text("The Shawshank Redemption",style: TextStyle(color: Colors.black45),),
    );
  }
}
