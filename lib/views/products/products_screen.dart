// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/products_controller.dart';
import 'package:e_mart_seller/services/firestore_services.dart';
import 'package:e_mart_seller/views/products/add_product.dart';
import 'package:e_mart_seller/views/products/product_details.dart';
import 'package:e_mart_seller/widgets/appbar_widget.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());

    return Scaffold(
      appBar: appbarWidget(title: products),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () async {
          await controller.getCategories();
          controller.populateCategoryList();
          Get.to(() => AddProduct());
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirestroeServices.getProducts(uid: currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          }

          var data = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  data.length,
                  (index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProductDetails(
                                data: data[index],
                              ));
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
                        subtitle: Row(
                          children: [
                            normalText(
                              text: "\$ ${data[index]['p_price']}",
                              color: darkGrey,
                            ),
                            10.widthBox,
                            boldText(
                              text: data[index]['is_featured'] == true
                                  ? "Featured"
                                  : "",
                              color: green,
                            ),
                          ],
                        ),
                        trailing: VxPopupMenu(
                          child: Icon(Icons.more_vert_rounded),
                          menuBuilder: () => Column(
                            children: List.generate(
                              popupMenuTitles.length,
                              (i) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      popupMenuIconList[i],
                                      color: data[index]['featured_id'] ==
                                                  currentUser!.uid &&
                                              i == 0
                                          ? green
                                          : darkGrey,
                                    ),
                                    13.widthBox,
                                    normalText(
                                      text: data[index]['featured_id'] ==
                                                  currentUser!.uid &&
                                              i == 0
                                          ? "Remove feature"
                                          : popupMenuTitles[i],
                                      color: darkGrey,
                                    ),
                                  ],
                                ).onTap(() {
                                  if (data[index]['is_featured'] == true) {
                                    controller.removeFeatured(
                                      docId: data[index].id,
                                    );
                                    Fluttertoast.showToast(msg: 'Removed');
                                  } else {
                                    controller.addFeatured(
                                      docId: data[index].id,
                                    );
                                    Fluttertoast.showToast(msg: 'Added');
                                  }
                                }),
                              ),
                            ),
                          ).box.rounded.white.width(200).make(),
                          clickType: VxClickType.singleClick,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
