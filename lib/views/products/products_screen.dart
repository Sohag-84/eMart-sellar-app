// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/services/firestore_services.dart';
import 'package:e_mart_seller/views/products/add_product.dart';
import 'package:e_mart_seller/views/products/product_details.dart';
import 'package:e_mart_seller/widgets/appbar_widget.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: products),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
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
                          Get.to(() => ProductDetails(data: data[index],));
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
                              text: data[index]['p_images'] == true
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
                              (index) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(popupMenuIconList[index]),
                                    13.widthBox,
                                    normalText(
                                        text: popupMenuTitles[index],
                                        color: darkGrey),
                                  ],
                                ),
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
