// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';

Widget chatBubble() {
  return Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: purpleColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(29),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(15),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normalText(text: 'your message..'),
        10.heightBox,
        normalText(text: "4.25 PM"),
      ],
    ),
  );
}
