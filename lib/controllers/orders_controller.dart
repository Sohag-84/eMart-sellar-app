import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';

class OrdersController extends GetxController {
  var confirmed = false.obs;
  var onDelivery = false.obs;
  var delivered = false.obs;

  var ordersList = [];

  getOders({required data}) {
    ordersList.clear();
    for (var item in data['orders']) {
      if (item['vendor_id'] == currentUser!.uid) {
        ordersList.add(item);
      }
      print("Product list$ordersList");
    }
  }

  changeStatus({required title, required status, required docId}) async {
    var store = firestore.collection(orderCollection).doc(docId);
    await store.set({
      title: status,
    }, SetOptions(merge: true));
  }
}
