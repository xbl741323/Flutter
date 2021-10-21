import 'package:flutter/material.dart';

// ignore: camel_case_types
class style_chip extends StatefulWidget {
  @override
  style_chip_state createState() => style_chip_state();
}

// ignore: camel_case_types
class style_chip_state extends State<style_chip> {
  bool chooseStatus = false;
  bool filterStatus = false;
  bool inputStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chip')),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Chip(
              label: Text(
                "普通的chip",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.deepPurple,
            ),
            Chip(
              avatar: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              label:
                  Text("带avatar的chip", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.deepPurple,
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/keqing.png'),
                radius: 18.0,
              ),
              label:
                  Text("带avatar图片的chip", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.deepPurple,
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/keqing.png'),
                radius: 30.0,
              ),
              padding: EdgeInsets.all(5.0),
              label: Text("padding为5,labelPadding为5的chip",
                  style: TextStyle(color: Colors.white)),
              labelPadding: EdgeInsets.all(5.0),
              backgroundColor: Colors.deepPurple,
            ),
            Chip(
              label: Text("带deleteIcon的chip",
                  style: TextStyle(color: Colors.white)),
              deleteIcon: Icon(Icons.close),
              deleteIconColor: Colors.white,
              onDeleted: () {
                print("点击了删除噢");
              },
              deleteButtonTooltipMessage: "弹出提示",
              backgroundColor: Colors.deepPurple,
            ),
            Chip(
              label: Text("圆角矩形的chip", style: TextStyle(color: Colors.white)),
              deleteIcon: Icon(Icons.close),
              deleteIconColor: Colors.white,
              onDeleted: () {
                print("点击了删除噢");
              },
              deleteButtonTooltipMessage: "弹出提示",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              backgroundColor: Colors.deepPurple,
            ),
            Chip(
              label: Text("带阴影的chip", style: TextStyle(color: Colors.white)),
              shadowColor: Colors.grey,
              elevation: 10.0,
              backgroundColor: Colors.deepPurple,
            ),
            ActionChip(
                label: Text('可点击的ActionChip'),
                labelStyle: TextStyle(color: Colors.white),
                tooltip: "可点击的ActionChip",
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  print('actionChip');
                }),
            ChoiceChip(
              label: Text("可勾选的ChoiceChip"),
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.deepPurple[100],
              selectedColor: Colors.deepPurple,
              onSelected: (val) {
                setState(() {
                  chooseStatus = val;
                });
              },
              selected: chooseStatus,
              pressElevation: 20.0,
            ),
            // FilterChip(label: Text('自带勾选的可选择的chip'), onSelected: ()=>{}),
            FilterChip(
              label: Text("可勾选的有勾勾FilterChip"),
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.deepPurple[100],
              selectedColor: Colors.deepPurple,
              onSelected: (val) {
                setState(() {
                  filterStatus = val;
                });
              },
              selected: filterStatus,
              pressElevation: 20.0,
              tooltip: "长按下的文本",
              avatar: Icon(
                Icons.anchor_sharp,
                color: Colors.white,
              ),
            ),
            InputChip(
                label: Text("比FilterChip多onPressed和onDeleted的InputChip"),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.deepPurple[100],
                selectedColor: Colors.deepPurple,
                onSelected: (val) {
                  setState(() {
                    inputStatus = val;
                  });
                },
                selected: inputStatus,
                pressElevation: 20.0,
                avatar: Icon(
                  Icons.whatshot_outlined,
                  color: Colors.white,
                ),
                deleteIcon: Icon(Icons.close),
                deleteButtonTooltipMessage: "deleteButtonTooltipMessage",
                onDeleted: () {
                  print("delete success");
                }),
            Divider(),
          ],
        ),
      ),
    );
  }
}
