// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/views/products/add_product.dart';
import 'package:e_mart_seller/views/products/product_details.dart';
import 'package:e_mart_seller/widgets/appbar_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              50,
              (index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => ProductDetails());
                    },
                    leading: Image.asset(
                      imgProduct,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: boldText(text: "Product title", color: fontGrey),
                    subtitle: Row(
                      children: [
                        normalText(text: "\$40", color: darkGrey),
                        10.widthBox,
                        boldText(text: "Featured", color: green)
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
      ),
    );
  }
}
