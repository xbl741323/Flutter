///按钮的widget完整写法
import 'package:flutter/material.dart';

class BackToTop extends StatefulWidget {
  final ScrollController controller;

  ///传入距离底部的距离
  final double bottom;

  BackToTop(this.controller, {this.bottom});

  @override
  _BackToTopState createState() => _BackToTopState();
}

class _BackToTopState extends State<BackToTop> {
  bool shown = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(isScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.removeListener(isScroll);
  }

  void isScroll() {
    final bool toShow = (widget.controller?.offset ?? 0) >
        MediaQuery.of(context).size.height / 2;
    if (toShow ^ shown) {
      setState(() {
        shown = toShow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: MediaQuery.of(context).padding.bottom + (widget.bottom ?? 40),
        right: 20,
        child: Offstage(
          offstage: !shown,
          child: GestureDetector(
            onTap: () {
              widget.controller?.animateTo(0,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            child: Container(
                height: 44,
                width: 44,
                padding: EdgeInsets.only(top: 3),
                alignment: Alignment(0, 0),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 0),
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.vertical_align_top,
                        size: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        'Top',
                        style:
                            TextStyle(fontSize: 10, color: Colors.deepPurple),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
