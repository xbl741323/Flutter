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
  int current = 1;
  int size = 10;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    //设置监听
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('滑动到了最底部');
        getMore();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  getMore() {
    setState(() {
      current += 1;
    });
    getData();
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
      'size': size,
      'start': current,
      'type': 4
    };
    api_login.getTestData(params).then((res) {
      if (res.data['code'] == 1000) {
        setState(() {
          this.dataList.addAll(res.data['data']['records']);
          total = res.data['data']['total'];
        });
        print(res.data['data']['total']);
        print(this.dataList.length);
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
            itemCount: dataList.length + 1,
            shrinkWrap: true,
            itemBuilder: _renderRow,
          ),
        ));
  }

  // 显示列表 + 上拉加载更多
  Widget _renderRow(BuildContext context, int index) {
    if (index < dataList.length) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getItem(index)],
      );
    } else {
      if (total > dataList.length) {
        return _getMoreWidget(true);
      } else {
        return _getMoreWidget(false);
      }
    }
  }

  // 显示加载更多样式
  Widget _getMoreWidget(status) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              status == true ? '加载中...' : '已经到底了...',
              style: TextStyle(fontSize: 16.0, color: Colors.deepPurple),
            ),
            status == true
                ? CircularProgressIndicator(
                    strokeWidth: 2.0,
                  )
                : Text('')
          ],
        ),
      ),
    );
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
