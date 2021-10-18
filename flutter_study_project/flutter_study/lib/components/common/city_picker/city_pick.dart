import 'package:city_pickers/city_pickers.dart';
import 'package:city_pickers/modal/result.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class city_picker extends StatefulWidget {
  @override
  city_picker_state createState() => city_picker_state();
}

class city_picker_state extends State<city_picker> {
  String area = '';
  String area1 = '';
  String area2 = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('城市三级联动选择器'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add_location),
                    this.area.length > 0
                        ? Text(
                            "$area",
                            style: TextStyle(color: Colors.black54),
                          )
                        : Text("省/市/区（呼出弹出层,显示多级选择器）", style: TextStyle(color: Colors.black54))
                  ],
                ),
                onTap: () async {
                  Result result = await CityPickers.showCityPicker(
                      context: context,
                      height: 250,
                      cancelWidget: Text(
                        "取消",
                        style: TextStyle(color: Colors.black),
                      ),
                      confirmWidget: Text(
                        "确定",
                        style: TextStyle(color: Colors.black),
                      ));
                  print(result);
                  setState(() {
                    this.area =
                        "${result.provinceName}/${result.cityName}/${result.areaName}";
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add_location),
                    this.area1.length > 0
                        ? Text(
                            "$area1",
                            style: TextStyle(color: Colors.black54),
                          )
                        : Text("省/市/区（呼出一层界面, 显示多级选择器）", style: TextStyle(color: Colors.black54))
                  ],
                ),
                onTap: () async {
                  Result result1 = await CityPickers.showFullPageCityPicker(
                    context: context,
                  );
                  print(result1);
                  setState(() {
                    this.area1 =
                        "${result1.provinceName}/${result1.cityName}/${result1.areaName}";
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add_location),
                    this.area2.length > 0
                        ? Text(
                            "$area2",
                            style: TextStyle(color: Colors.black54),
                          )
                        : Text("市（呼出一层, 显示支持字母定位城市选择器）", style: TextStyle(color: Colors.black54))
                  ],
                ),
                onTap: () async {
                  Result result2 = await CityPickers.showCitiesSelector(
                      context: context,
                      hotCities: [
                        HotCity(name: "北京市", id: 310000),
                        HotCity(name: "上海市", id: 310000),
                        HotCity(name: "深圳市", id: 440300),
                      ]);
                  print(result2);
                  setState(() {
                    if (result2 != null) {
                      this.area2 = "${result2.cityName}";
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(city_picker oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
