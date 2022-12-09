// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/orders_controller.dart';
import 'package:e_mart_seller/views/orders_screen/components/order_place_details.dart';
import 'package:e_mart_seller/widgets/custom_button.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailsScreen extends StatefulWidget {
  final dynamic data;
  const OrderDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  var controller = Get.put(OrdersController());

  @override
  void initState() {
    super.initState();
    controller.getOders(data: widget.data);
    controller.confirmed.value = widget.data['order_confirmed'];
    controller.onDelivery.value = widget.data['order_on_delivery'];
    controller.delivered.value = widget.data['order_delivered'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: darkGrey),
          title: boldText(text: "Order Details", size: 16, color: fontGrey),
        ),
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: customButton(
              isLoading: false,
              title: "Confirm Order",
              onPressed: () {
                controller.confirmed(true);
                controller.changeStatus(
                  title: 'order_confirmed',
                  status: true,
                  docId: widget.data.id,
                );
              },
              color: green,
            ),
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
                    visible: controller.confirmed.value,
                    child: Column(
                      children: [
                        8.heightBox,
                        boldText(
                            text: "Order Status", color: fontGrey, size: 16),
                        SwitchListTile(
                          activeColor: green,
                          value: true,
                          onChanged: (value) {},
                          title: boldText(
                            text: "Placed",
                            color: fontGrey,
                          ),
                        ),
                        SwitchListTile(
                          activeColor: green,
                          value: controller.confirmed.value,
                          onChanged: (value) {
                            controller.confirmed.value = value;
                          },
                          title: boldText(
                            text: "Confirmed",
                            color: fontGrey,
                          ),
                        ),
                        SwitchListTile(
                          activeColor: green,
                          value: controller.onDelivery.value,
                          onChanged: (value) {
                            controller.onDelivery.value = value;
                            controller.changeStatus(
                              title: 'order_on_delivery',
                              status: value,
                              docId: widget.data.id,
                            );
                          },
                          title: boldText(
                            text: "On Delivery",
                            color: fontGrey,
                          ),
                        ),
                        SwitchListTile(
                          activeColor: green,
                          value: controller.delivered.value,
                          onChanged: (value) {
                            controller.delivered.value = value;
                            controller.changeStatus(
                              title: 'order_delivered',
                              status: value,
                              docId: widget.data.id,
                            );
                          },
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
                    detail1: "${widget.data['order_code']}",
                    detail2: "${widget.data['shipping_method']}",
                  ),
                  orderPlaceDetails(
                    title1: "Order Date",
                    title2: "Payment Method",
                    detail1: intl.DateFormat()
                        .add_yMd()
                        .format(widget.data['order_date'].toDate()),
                    detail2: "${widget.data['payment_method']}",
                  ),
                  orderPlaceDetails(
                    title1: "Payment Status",
                    title2: "Delivery Status",
                    detail1: "Unpaid",
                    detail2: "Order Placed",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8),
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
                              "Name:${widget.data['order_by_name']}"
                                  .text
                                  .make(),
                              "Email: ${widget.data['order_by_email']}"
                                  .text
                                  .make(),
                              "Address: ${widget.data['order_by_address']}"
                                  .text
                                  .make(),
                              "City: ${widget.data['order_by_city']}"
                                  .text
                                  .make(),
                              "Country: Bangladesh".text.make(),
                              "State: ${widget.data['order_by_state']}"
                                  .text
                                  .make(),
                              "Phone: ${widget.data['order_by_phone_number']}"
                                  .text
                                  .make(),
                              "Postal code: ${widget.data['order_by_postalcode']}"
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
                                text: "Total Amount: ",
                                color: purpleColor,
                              ),
                              boldText(
                                text: "\$${widget.data['total_amount']}",
                                color: red,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
                  .box
                  .outerShadowMd
                  .roundedSM
                  .border(color: lightGrey)
                  .white
                  .make(),
              Divider(),
              10.heightBox,
              boldText(text: "Ordered Product", color: fontGrey, size: 16),
              10.heightBox,
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(controller.ordersList.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlaceDetails(
                        title1: "${controller.ordersList[index]['title']}",
                        title2:
                            "${controller.ordersList[index]['total_price']}",
                        detail1:
                            "Quantity: ${controller.ordersList[index]['quantity']}",
                        detail2: 'Refundable',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Container(
                          height: 20,
                          width: 30,
                          color: Color(
                            int.parse(
                                "${controller.ordersList[index]['color']}"),
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  );
                }).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(EdgeInsets.only(bottom: 4))
                  .make(),
              20.heightBox,
            ],
          ),
        ),
      );
    });
  }
}
