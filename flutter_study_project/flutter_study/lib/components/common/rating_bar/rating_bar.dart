import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class rating_bar_example extends StatefulWidget {
  @override
  rating_bar_state createState() => rating_bar_state();
}

class rating_bar_state extends State<rating_bar_example> {
  var star = '3.0';
  var star2 = '3.0';

  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RatingBar星级评价'),
      ),
      body: Container(
        child: ListView.builder(
            controller: _controller,
            itemCount: 1,
            itemBuilder: (context, index) {
              return getBody(index);
            }),
      ),
    );
  }

  Widget getBody(index) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar.builder(
            initialRating: 3,
            unratedColor: Colors.deepPurple.withOpacity(0.5),
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.deepPurple,
            ),
            onRatingUpdate: (rating) {
              print(rating);
              setState(() {
                star = rating.toString();
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '当前' + '${star}' + '分',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
          RatingBar.builder(
            initialRating: 3,
            unratedColor: Colors.deepPurple.withOpacity(0.5),
            itemCount: 5,
            allowHalfRating: true,
            itemBuilder: (context, index) => Icon(
              index == 0
                  ? Icons.sentiment_very_dissatisfied
                  : index == 1
                      ? Icons.sentiment_dissatisfied
                      : index == 2
                          ? Icons.sentiment_neutral
                          : index == 3
                              ? Icons.sentiment_satisfied
                              : index == 4
                                  ? Icons.sentiment_very_satisfied
                                  : '',
              color: Colors.deepPurple,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                star2 = rating.toString();
              });
            },
          ),
          Container(
            child: Text(
              '当前' + '${star2}' + '分',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
