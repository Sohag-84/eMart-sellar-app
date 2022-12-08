import 'package:e_mart_seller/const/const.dart';

class FirestroeServices {
  static getUserProfile({required uid}) {
    return firestore
        .collection(vendorCollection)
        .where('id', isEqualTo: uid)
        .get();
  }
}
