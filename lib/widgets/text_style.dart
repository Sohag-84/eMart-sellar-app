import 'package:e_mart_seller/const/const.dart';

Widget normalText(
    {required String text, Color color = Colors.white, double size = 14.0}) {
  return text.text.color(color).size(size).make();
}

Widget boldText(
    {required String text, Color color = Colors.white, double size = 14.0}) {
  return text.text.semiBold.size(size).color(color).make();
}
