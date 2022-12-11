// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/services/firestore_services.dart';
import 'package:e_mart_seller/views/products/product_details.dart';
import 'package:e_mart_seller/widgets/appbar_widget.dart';
import 'package:e_mart_seller/widgets/dashboard_button.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: dahsboard),
      body: StreamBuilder(
          stream: FirestroeServices.getProducts(uid: currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;
              data = data.sortedBy(
                (a, b) =>
                    b['p_wishlist'].length.compareTo(a['p_wishlist'].length),
              );
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dashboardButton(
                          context: context,
                          title: products,
                          quantity: "${data.length}",
                          icon: icProducts,
                        ),
                        dashboardButton(
                          context: context,
                          title: orders,
                          quantity: "30",
                          icon: icOrders,
                        ),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dashboardButton(
                          context: context,
                          title: rating,
                          quantity: "10",
                          icon: icStar,
                        ),
                        dashboardButton(
                          context: context,
                          title: totalSells,
                          quantity: "30",
                          icon: icOrders,
                        ),
                      ],
                    ),
                    10.heightBox,
                    Divider(color: darkGrey),
                    10.heightBox,
                    boldText(text: popularProducts, color: fontGrey, size: 16),
                    20.heightBox,
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        children: List.generate(
                          data.length,
                          (index) {
                            return ListTile(
                              onTap: () {
                                Get.to(() => ProductDetails(data: data[index]));
                              },
                              leading: Image.network(
                                data[index]['p_images'][0],
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                              title: boldText(
                                text: "${data[index]['p_name']}",
                                color: fontGrey,
                              ),
                              subtitle: normalText(
                                text: "\$ ${data[index]['p_price']}",
                                color: darkGrey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
