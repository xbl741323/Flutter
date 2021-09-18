import 'package:flutter/material.dart';
import 'package:flutter_study/api/api_login.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  final ScrollController _controller = ScrollController(keepScrollOffset: false);
  List<dynamic> dataList = <dynamic>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  getData() {
    api_login.getTestData().then((res) {
      if (res.data['code'] == 1000) {
        this.dataList = res.data['data']['recommend'];
        print(this.dataList);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("网络和Http"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(top: 2, right: 5, bottom: 5, left: 5),
          child: ListView.builder(
              controller: _controller, //这里的controller一定要赋值，这样才能保证是同一个控制器中
              itemCount: dataList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [getItem(index)],
                );
              }),
        ));
  }

  // 列表单项
  Widget getItem(index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 2, bottom: 10),
      margin: EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '${dataList[index]['title']}',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Text(
              '${dataList[index]['slogan']}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
