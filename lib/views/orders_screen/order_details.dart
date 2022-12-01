// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/views/orders_screen/components/order_place_details.dart';
import 'package:e_mart_seller/widgets/custom_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: darkGrey),
        title: boldText(text: "Order Details", size: 16, color: fontGrey),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: customButton(
          title: "Confirm Order",
          onPressed: () {},
          color: green,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                //oder status section
                Visibility(
                  child: Column(
                    children: [
                      8.heightBox,
                      boldText(text: "Order Status", color: fontGrey, size: 16),
                      SwitchListTile(
                        activeColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(
                          text: "Placed",
                          color: fontGrey,
                        ),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(
                          text: "Confirmed",
                          color: fontGrey,
                        ),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(
                          text: "On Delivery",
                          color: fontGrey,
                        ),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(
                          text: "Delivered",
                          color: fontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .outerShadowMd
                      .roundedSM
                      .white
                      .border(color: lightGrey)
                      .make(),
                ),

                //order details section
                orderPlaceDetails(
                  title1: "Order Code",
                  title2: "Shipping Method",
                  detail1: "data['order_code']",
                  detail2: "data['shipping_method']",
                ),
                orderPlaceDetails(
                    title1: "Order Date",
                    title2: "Payment Method",
                    detail1: "${DateTime.now()}",
                    detail2: "data['payment_method'],"),
                orderPlaceDetails(
                  title1: "Payment Status",
                  title2: "Delivery Status",
                  detail1: "Unpaid",
                  detail2: "Order Placed",
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldText(
                                text: "Shipping Address", color: purpleColor),
                            "Name:{data['order_by_name']}".text.make(),
                            "Email: {data['order_by_email']}".text.make(),
                            "Address: {data['order_by_address']}".text.make(),
                            "City: {data['order_by_city']}".text.make(),
                            "Country: Bangladesh".text.make(),
                            "State: {data['order_by_state']}".text.make(),
                            "Phone: data['order_by_phone_number']}".text.make(),
                            "Postal code: {data['order_by_postalcode']}"
                                .text
                                .make(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldText(
                                text: "Total Amount: ", color: purpleColor),
                            boldText(text: "\$500", color: red, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).box.outerShadowMd.roundedSM.border(color: lightGrey).white.make(),
            Divider(),
            10.heightBox,
            boldText(text: "Ordered Product", color: fontGrey, size: 16),
            10.heightBox,
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(5, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    orderPlaceDetails(
                      title1: "orderData['title']",
                      title2: "orderData['total_price']",
                      detail1: "Quantity: {orderData['quantity']}",
                      detail2: 'Refundable',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        height: 20,
                        width: 30,
                        color: purpleColor,
                      ),
                    ),
                    Divider()
                  ],
                );
              }).toList(),
            ).box.outerShadowMd.white.margin(EdgeInsets.only(bottom: 4)).make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
