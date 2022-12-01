
import 'package:e_mart_seller/const/const.dart';

Widget orderPlaceDetails({
  required String title1,
  required String title2,
  required String detail1,
  required String detail2,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           boldText(text: title1,color: purpleColor),
           boldText(text: detail1,color: red),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: title2, color: purpleColor),
              boldText(text: detail2, color: fontGrey),
            ],
          ),
        ),
      ],
    ),
  );
}
