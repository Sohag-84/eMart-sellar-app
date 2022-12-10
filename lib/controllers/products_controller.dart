import 'dart:io';

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProductsController extends GetxController {
  //text field
  var pNameController = TextEditingController();
  var pDescController = TextEditingController();
  var pPriceController = TextEditingController();
  var pQuanityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImageList = RxList<dynamic>.generate(3, (index) => null);

  var categoryValue = ''.obs;
  var subCategoryValue = ''.obs;
  var selectedColorIndex = 0.obs;

  //for product categories
  getCategories() async {
    var data = await rootBundle.loadString('lib/services/category_model.json');
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  populateCategoryList() {
    categoryList.clear();
    for (var item in category) {
      categoryList.add(item.name);
    }
  }

  populateSubcategory({required cat}) {
    subcategoryList.clear();
    var data = category.where((element) => element.name == cat).toList();
    for (var i = 0; i < data.first.subcategory.length; i++) {
      subcategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImage({required index}) async {
    try {
      var img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (img == null) {
        return;
      } else {
        pImageList[index] = File(img.path);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
