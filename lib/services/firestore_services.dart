import 'package:e_mart_seller/const/const.dart';

class FirestroeServices {
  static getUserProfile({required uid}) {
    return firestore
        .collection(vendorCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  static getMessages({required uid}) {
    return firestore
        .collection(chatCollection)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  static getOrders({required uid}) {
    return firestore
        .collection(orderCollection)
        .where('vendors', arrayContains: uid)
        .snapshots();
  }

  static getProducts({required uid}) {
    return firestore
        .collection(productCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
}
