// ignore_for_file: sort_child_properties_last

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/products_controller.dart';

Widget productDropDown({
  required String hint,
  required List<String> list,
  required dropValue,
  required ProductsController controller,
}) {
  return Obx(
     () {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          items: list.map((e) {
            return DropdownMenuItem(
              child: e.toString().text.make(),
              value: e,
            );
          }).toList(),
          hint: normalText(text: hint, color: fontGrey),
          value: dropValue.value == '' ? null : dropValue.value,
          isExpanded: true,
          onChanged: (newValue) {
            if (hint == 'Choose Category') {
              controller.subCategoryValue.value = "";
              controller.populateSubcategory(cat: newValue.toString());
            }
            dropValue.value = newValue.toString();
          },
        ),
      )
          .box
          .white
          .roundedSM
          .padding(const EdgeInsets.symmetric(horizontal: 4))
          .make();
    }
  );
}
