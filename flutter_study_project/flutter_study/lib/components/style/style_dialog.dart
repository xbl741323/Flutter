import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_dialog extends StatefulWidget {
  @override
  style_dialog_state createState() => style_dialog_state();
}

// ignore: camel_case_types
class style_dialog_state extends State<style_dialog> {
  List nameList = ["Option A", "Option B", "Option C"];

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("AlertDialog"),
            content: Text("您确定要删除吗?"),
            actions: <Widget>[
              TextButton(
                child: Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.of(context).pop("Cancel");
                },
              ),
              TextButton(
                child: Text("确定"),
                onPressed: () {
                  print("确定");
                  Navigator.of(context).pop("Ok");
                },
              )
            ],
          );
        });
  }

  showSimpleDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: Text("SimpleDialog"),
              children: nameList.map((e) {
                return getItem(e);
              }).toList());
        });
  }

  Widget getItem(title) {
    return SimpleDialogOption(
      child: Text("${title}"),
      onPressed: () {
        print("${title}");
        Navigator.pop(context, "${title}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("各种Dialog"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: Text('这里展示AlertDialog和SimpleDialog'),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                onPressed: () => showAlertDialog(),
                child: Text(
                  'AlertDialog',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                onPressed: () => showSimpleDialog(),
                child: Text(
                  'SimpleDialog',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
