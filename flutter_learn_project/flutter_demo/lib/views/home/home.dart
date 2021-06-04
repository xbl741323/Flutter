import 'package:flutter/material.dart';
import 'package:flutter_demo/models/home_model.dart';
import 'package:flutter_demo/network/http_request.dart';

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
      this.movieItems = movies;
      print(this.movieItems);
    }).catchError((err)=>{
      print(err)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: movieItems.length,
            itemBuilder: (BuildContext context,int index){
             return Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ElevatedButton(
                   onPressed:()=>{
                     print(widget)
                   },
                   child: Text("No.1",style: TextStyle(fontSize: 14),),
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.orange[200]),
                     foregroundColor:MaterialStateProperty.all(Colors.brown[400]),
                     minimumSize: MaterialStateProperty.all(Size(50, 30)),
                   ),
                 ),
                 Row(children: [
                   Image.asset(
                     "assets/images/home/movie.jpg",
                     width: 100,
                     height: 120,
                     fit:  BoxFit.cover,
                   ),
                   Container(
                     width: 240,
                     margin: EdgeInsets.all(10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(children: [
                           Icon(Icons.whatshot_outlined,size: 15,),
                           Text("肖申克的救赎",style: TextStyle(fontSize: 16),)
                         ],),
                         Row(children: [
                           Text("评分：9.7",style: TextStyle(fontSize: 12),)
                         ],),
                         Text(
                           "犯罪/剧情/弗兰克·德拉邦特/提姆·罗宾斯/摩根·富兰克林/本杰明·亚里士多德",
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                         ),
                       ],
                     ),
                   ),
                   Column(
                     children: [
                       Icon(Icons.people),
                       Text("想看"),
                     ],
                   )
                 ]),
                 Container(
                   width: 500,
                   child: ElevatedButton(
                     onPressed:()=>{},
                     child: Text("观后感"),
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Colors.white38),
                         foregroundColor:MaterialStateProperty.all(Colors.black54)
                     ),
                   ),
                 ),
               ],
             );
            }
        ),
      )
    );
  }
}
