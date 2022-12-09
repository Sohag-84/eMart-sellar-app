// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/services/firestore_services.dart';
import 'package:e_mart_seller/views/orders_screen/order_details.dart';
import 'package:e_mart_seller/widgets/appbar_widget.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: orders),
      body: StreamBuilder(
        stream: FirestroeServices.getOrders(uid: currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) {
                      var time = data[index]['order_date'].toDate();
                      return ListTile(
                        onTap: () {
                          Get.to(() => OrderDetailsScreen(
                                data: data[index],
                              ));
                        },
                        tileColor: textfieldGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: boldText(
                            text: "${data[index]['order_code']}",
                            color: purpleColor),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: fontGrey,
                                ),
                                10.widthBox,
                                boldText(
                                  text: intl.DateFormat()
                                      .add_yMd()
                                      .format(time),
                                  color: fontGrey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.payment, color: fontGrey),
                                10.widthBox,
                                boldText(text: unpaid, color: red)
                              ],
                            ),
                          ],
                        ),
                        trailing: boldText(
                          text: "\$ ${data[index]['total_amount']}",
                          color: purpleColor,
                          size: 16,
                        ),
                      ).box.margin(EdgeInsets.only(bottom: 8)).make();
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}