import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  late QueryDocumentSnapshot snapshot;

  var profileImagePath = "".obs;
  var profileImageLink = "";

  //for button loading
  var isLoading = false.obs;

  //text field controller
  var nameController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  changeImage() async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (img == null) {
        return;
      } else {
        profileImagePath.value = img.path;
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  //for upload image
  uploadProfileImage() async {
    var fileName = basename(profileImagePath.value);
    var destination = "image/${currentUser!.uid}/$fileName";
    Reference reference = firebaseStorage.ref().child(destination);
    reference.putFile(File(profileImagePath.value));
    profileImageLink = await reference.getDownloadURL();
  }

  updatedProfile({required name, required password, required imageUrl}) async {
    var store = firestore.collection(vendorCollection).doc(currentUser!.uid);
    await store.set({
      'vendor_name': name,
      'password': password,
      'img': imageUrl,
    }, SetOptions(merge: true));

    //for button loading
    isLoading(false);
  }

  //change password
  changeAuthPassword(
      {required email, required password, required newPassword}) async {
    var cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
