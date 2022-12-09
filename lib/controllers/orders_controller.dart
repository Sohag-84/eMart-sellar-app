import 'package:e_mart_seller/const/const.dart';

class OrdersController extends GetxController {
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
}
