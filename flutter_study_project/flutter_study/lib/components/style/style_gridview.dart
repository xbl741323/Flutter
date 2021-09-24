import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_gridview extends StatefulWidget {
  @override
  style_grid_view createState() => style_grid_view();
}

class style_grid_view extends State<style_gridview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context,int index){
              return Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text('使用GridView将widget放置为二维列表。 GridView提供了两个预制list，或者您可以构建自定义网格。当GridView检测到其内容太长而不适合渲染框时，它会自动滚动。'),
                    getBody()
                  ],
                ),
              ); // 封装MovieItem样式组件
            }
        )
    );
  }

  Widget getBody() {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: getGridBody(),
    );
  }

  Widget getGridBody() {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset("assets/images/one.jpg");
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 2,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 0.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4),
    );
  }
}
