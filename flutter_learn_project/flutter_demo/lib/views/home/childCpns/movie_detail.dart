import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
        ),
        body: getMainWidget()
    );
  }

  // 主布局
  Widget getMainWidget(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getMovieWidget(),
          getPerformerWidget(),
          getCommentWidget()
        ],
      ),
    );
  }

  // 影视介绍
  Widget getMovieWidget(){
    return Container(
      padding: EdgeInsets.only(top:15,right: 15,bottom: 15,left: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(127, 98, 70, 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getImageWidget(),
          getMovieDesc()
        ],
      ),
    );
 }

  // 影视剧照
  Widget getImageWidget(){
    return Container(
      child: Image.asset(
        "assets/images/home/qiao.jpg",
        width: 102,
        height: 142,
        fit: BoxFit.cover,
      ),
    );
  }

  // 影视信息介绍
  Widget getMovieDesc(){
    return Expanded( // 除去两端剩余的部分，可以很好的兼容宽度自适应，做手机适配
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "乔家的儿女",
              style: TextStyle(fontSize: 23,color: Color(0xFFFFFFFF)),
            ),
            Text(
              "乔家的儿女（2021）",
              style: TextStyle(fontSize: 15,color: Color(0xFFFFFFFF)),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration( // 注意：这里color和decoration不能同时存在 decoration里面可以设置border相关样式
                        color: Color(0xFFFEF0B3),
                        borderRadius: BorderRadius.only(
                            topLeft:Radius.circular(3),
                            bottomLeft: Radius.circular(3)
                        )
                    ),
                    child: Text("No.2",style: TextStyle(color: Color(0xFF9D5F00))),
                  ),
                  Container(
                    width: 137,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration( // 注意：这里color和decoration不能同时存在 decoration里面可以设置border相关样式
                        color: Color(0xFFFEC36E),
                        borderRadius: BorderRadius.only(
                            topRight:Radius.circular(3),
                            bottomRight: Radius.circular(3)
                        )
                    ),
                    child: Text("一周华语口碑剧集榜",style: TextStyle(color: Color(0xFF9D5F00))),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                "中国大陆 / 剧情 / 家庭 / 2021-08-17(中国大陆)上映 / 片长45分钟",
                style: TextStyle(fontSize: 12,color: Color.fromRGBO(255, 255, 255, 0.8)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  // 剧集、演员介绍
  Widget getPerformerWidget(){
    return Container();
  }
  // 评论区
  Widget getCommentWidget(){
    return Container();
  }
}


