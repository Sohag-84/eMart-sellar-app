import 'package:e_mart_seller/const/const.dart';

Widget dashboardButton(
    {required context,
    required String title,
    required quantity,
    required icon}) {
  var size = MediaQuery.of(context).size.width;
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            boldText(text: title, size: 16),
            boldText(text: quantity, size: 19)
          ],
        ),
      ),
      Image.asset(
        icon,
        color: white,
        width: 40,
      )
    ],
  ).box.color(purpleColor).size(size * 0.45, 80).rounded.p12.make();
}
