import 'package:e_mart_seller/const/const.dart';

class Homecontroller extends GetxController {
  var navIndex = 0.obs;

  var username = '';

  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  getUsername() async {
    var name = await firestore
        .collection(vendorCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendor_name'];
      }
    });
    username = name;
  }
}
