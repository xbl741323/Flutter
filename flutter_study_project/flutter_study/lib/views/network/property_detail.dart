import 'package:flutter/material.dart';
import 'package:flutter_study/api/api_login.dart';

class PropertyDetail extends StatefulWidget {

  final String number;
  PropertyDetail({Key key, @required this.number}) : super(key: key);

  @override
  PropertyDetailState createState() => PropertyDetailState();
}

class PropertyDetailState extends State<PropertyDetail> {
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);
  var propertyInfo = {};

  getData() {
    var params = {
      'number': widget.number,
      'type': 4,
      'token': 3,
      'app': 'app'
    };
    api_login.getTestDetail(params).then((res) {
      setState(() {
        this.propertyInfo = res.data['data']['detail'];
      });
      print(this.propertyInfo);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${propertyInfo['title']}'),
      ),
      body: Container(
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    return ListView.builder(
        controller: _controller,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://static.wotao.com/' +
                      '${this.propertyInfo['coverUrl']}',
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    '${this.propertyInfo['title']}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    '${this.propertyInfo['slogan']}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                // Row(
                //   children: this.propertyInfo['categories'].map((e)=>getItem(e)).toList(),
                // )
              ],
            ),
          );
        });
  }

  Widget getItem(e){
    return Text('3');
  }
}
