// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';

Widget customTextField(
    {required label, required hintText, controller, isDesc = false}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(color: white),
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
      label: normalText(text: label),
      hintText: hintText,
      hintStyle: TextStyle(color: darkGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: white),
      ),
    ),
  );
}
