import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/home_controller.dart';
import 'package:e_mart_seller/models/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProductsController extends GetxController {
  //for loading indicator
  var isLoading = false.obs;

  //text field
  var pNameController = TextEditingController();
  var pDescController = TextEditingController();
  var pPriceController = TextEditingController();
  var pQuanityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImageList = RxList<dynamic>.generate(3, (index) => null);
  var pImageLinksList = [];

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

  uploadImage() async {
    pImageLinksList.clear();

    for (var item in pImageList) {
      if (item != null) {
        var fileName = basename(item.path);
        var destination = "image/vendors/${currentUser!.uid}/$fileName";
        Reference reference = FirebaseStorage.instance.ref().child(destination);
        await reference.putFile(item);
        var productImagesLink = await reference.getDownloadURL();
        pImageLinksList.add(productImagesLink);
      }
    }
  }

  uploadProduct() async {
    var store = firestore.collection(productCollection).doc();
    await store.set({
      'is_featured': false,
      'p_category': categoryValue.value,
      'p_subcategory': subCategoryValue.value,
      'p_colors': FieldValue.arrayUnion([
        Colors.red.value.toString(),
        Colors.black.value.toString(),
        Colors.brown.value.toString(),
      ]),
      'p_images': FieldValue.arrayUnion(pImageLinksList),
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_name': pNameController.text,
      'p_desc': pDescController.text,
      'p_price': pPriceController.text,
      'p_quantity': pQuanityController.text,
      'p_seller': Get.put(Homecontroller()).username,
      'p_rating': "5.0",
      'vendor_id': currentUser!.uid,
      'featured_id': '',
    });
    isLoading(false);
    Fluttertoast.showToast(msg: "Product uploaded");
  }

  //add featrued
  addFeatured({required docId}) async {
    await firestore.collection(productCollection).doc(docId).set({
      'featured_id': currentUser!.uid,
      'is_featured': true,
    }, SetOptions(merge: true));
  }

  //remove featrued
  removeFeatured({required docId}) async {
    await firestore.collection(productCollection).doc(docId).set({
      'featured_id': "",
      'is_featured': false,
    }, SetOptions(merge: true));
  }
}
