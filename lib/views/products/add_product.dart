// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/views/products/components/product_drop_down.dart';
import 'package:e_mart_seller/views/products/components/product_imege.dart';
import 'package:e_mart_seller/widgets/custom_textfield.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        title: boldText(text: "Product Details", color: white, size: 16),
        actions: [
          TextButton(
            onPressed: () {},
            child: boldText(
              text: "Save",
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(label: "Product Name", hintText: "eg. BMW"),
              10.heightBox,
              customTextField(
                label: "Description",
                hintText: "eg. nice product",
                isDesc: true,
              ),
              10.heightBox,
              customTextField(label: "Price", hintText: "eg. 100"),
              10.heightBox,
              customTextField(label: "Quantity", hintText: "eg. 100"),
              10.heightBox,
              productDropDown(hint: "Choose Category"),
              10.heightBox,
              productDropDown(hint: "Choose Subcategory"),
              10.heightBox,
              Divider(color: white),
              boldText(text: 'Choose product images:'),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => productImages(label: "${index + 1}")),
              ),
              5.heightBox,
              normalText(text: "*First image will your product image"),
              Divider(color: white),
              10.heightBox,
              boldText(text: "Choose product color:"),
              10.heightBox,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                    9,
                    (index) => Stack(
                          alignment: Alignment.center,
                          children: [
                            VxBox()
                                .color(Vx.randomColor)
                                .size(50, 50)
                                .roundedFull
                                .make(),
                            Icon(Icons.done, color: white),
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
