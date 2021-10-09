import 'package:flutter/material.dart';
import 'package:flutter_study/api/api_login.dart';
import 'package:flutter_study/views/network/property_detail.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);
  List<dynamic> dataList = <dynamic>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  skipDetail(number) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (ctx) => PropertyDetail(
              number: number,
            )));
  }

  getData() {
    var params = {
      'areaNos': ["100001", "100001"],
      'categories': [
        {'id': 2, 'name': "归口", 'optionIds': []}
      ],
      'isHotSpot': false,
      'isNewest': false,
      'size': 25,
      'start': 1,
      'type': 4
    };
    api_login.getTestData(params).then((res) {
      if (res.data['code'] == 1000) {
        setState(() {
          this.dataList = res.data['data']['records'];
        });
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
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10, right: 2, bottom: 10),
        margin: EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
            color: Colors.deepPurple,
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
      ),
      onTap: () => skipDetail(this.dataList[index]['number']),
    );
  }
}
