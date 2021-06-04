import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';
import 'package:flutter_demo/network/http_request.dart';
import 'package:flutter_demo/views/home/childCpns/movie_list_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("豆瓣App"),
      ),
      body: HomeBody()
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<MovieItem> movieItems = [];

  @override
  void initState() {
    super.initState();

    HttpRequest.request("https://www.wotao.com/service/policy/detail?number=XM20210525001&type=4&token=2").then((value) {
      final recommends = value.data["data"]["recommend"];
      print(recommends);
      List<MovieItem> movies = [];
      for(var sub in recommends){
        movies.add(MovieItem.fromMap(sub));
      }
      setState(() { // 数据改变时重新加载，更新数据
        this.movieItems = movies;
      });
      print(this.movieItems);
    }).catchError((err)=>{
      print(err)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: movieItems.length,
          itemBuilder: (BuildContext context,int index){
           return MovieListItem(movieItems[index]); // 封装MovieItem样式组件
          }
      )
    );
  }
}
