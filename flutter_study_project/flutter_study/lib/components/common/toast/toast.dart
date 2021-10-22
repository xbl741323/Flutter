import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';

class ToastUi extends StatefulWidget {
  @override
  ToastState createState() => ToastState();
}

class ToastState extends State<ToastUi> {
  viewToast() {
    showToast('早上好鸭！',
        radius: 5,
        backgroundColor: Colors.black54,
        textPadding: EdgeInsets.all(12));
  }

  viewIdeToast() {
    var w = Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((6.0)),
          color: Colors.black.withOpacity(0.6),
        ),
        width: 120,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.whatshot_rounded,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                '早上好鸭！',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
    showToastWidget(w);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast组件'),
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
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () => viewToast(),
              child: Text(
                'Toast',
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () => viewIdeToast(),
              child: Text(
                '自定义Toast',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
