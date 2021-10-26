import 'package:flutter/material.dart';
import 'package:location/location.dart';

// ignore: camel_case_types
class location_example extends StatefulWidget {
  @override
  location_example_state createState() => location_example_state();
}

// ignore: camel_case_types
class location_example_state extends State<location_example> {
  LocationData locationData;

  getLocation() {
    Location location = new Location();
    location.getLocation().then((value) {
      setState(() {
        locationData = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('location获取定位'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            onPressed: () => getLocation(),
            child: Text(
              '点击获取当前地址',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(locationData != null
              ? '定位值：' +
                  '【latitude：${locationData.latitude}，longitude：${locationData.longitude}】'
              : '')
        ],
      ),
    );
  }
}
