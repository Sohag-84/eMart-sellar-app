import 'package:e_mart_seller/const/const.dart';

Widget productImages({required String label, onPressed}) {
  return label.text.bold.makeCentered().color(white).box.size(100, 100).make();
}
