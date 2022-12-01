import 'package:e_mart_seller/const/const.dart';

Widget productDropDown({required String hint}) {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      items: const [],
      hint: normalText(text: hint, color: fontGrey),
      value: null,
      isExpanded: true,
      onChanged: (value) {},
    ),
  )
      .box
      .white
      .roundedSM
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .make();
}
