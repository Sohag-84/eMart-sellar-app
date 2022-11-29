import 'package:e_mart_seller/const/const.dart';
import 'package:intl/intl.dart' as intl;

AppBar appbarWidget({required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      Center(
        child: normalText(
          text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
          color: purpleColor,
        ),
      ),
      12.widthBox,
    ],
    title: boldText(text: title, color: fontGrey, size: 19),
  );
}
