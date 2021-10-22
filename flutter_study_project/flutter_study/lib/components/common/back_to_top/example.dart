import 'package:flutter/material.dart';

import 'back_to_top.dart';

class ToTop extends StatefulWidget {
  @override
  ToTopState createState() => ToTopState();
}

class ToTopState extends State<ToTop> {
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('回到顶部'),
        ),
        body: Stack(
          children: [
            Container(
              child: ListView.builder(
                  controller: _controller,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return getBody(index);
                  }),
            ),
            BackToTop(_controller),
          ],
        ));
  }

  Widget getBody(index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.deepPurple, width: 2),
        ),
        color: Colors.white,
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset('assets/images/keqing.png'),
          )
        ],
      ),
    );
  }
}
