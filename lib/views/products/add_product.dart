// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/products_controller.dart';
import 'package:e_mart_seller/views/products/components/product_drop_down.dart';
import 'package:e_mart_seller/views/products/components/product_imege.dart';
import 'package:e_mart_seller/widgets/custom_textfield.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();

    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        title: boldText(text: "Add Product", color: white, size: 16),
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
              5.heightBox,
              customTextField(
                label: "Product Name",
                hintText: "eg. BMW",
                controller: controller.pNameController,
              ),
              10.heightBox,
              customTextField(
                label: "Description",
                hintText: "eg. nice product",
                isDesc: true,
                controller: controller.pDescController,
              ),
              10.heightBox,
              customTextField(
                label: "Price",
                hintText: "eg. 100",
                controller: controller.pPriceController,
              ),
              10.heightBox,
              customTextField(
                label: "Quantity",
                hintText: "eg. 100",
                controller: controller.pQuanityController,
              ),
              10.heightBox,
              productDropDown(
                hint: "Choose Category",
                list: controller.categoryList,
                dropValue: controller.categoryValue,
                controller: controller,
              ),
              10.heightBox,
              productDropDown(
                hint: "Choose Subcategory",
                list: controller.subcategoryList,
                dropValue: controller.subCategoryValue,
                controller: controller,
              ),
              10.heightBox,
              Divider(color: white),
              boldText(text: 'Choose product images:'),
              10.heightBox,
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                    (index) => controller.pImageList[index] != null
                        ? Image.file(
                            controller.pImageList[index],
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ).onTap(() {
                            controller.pickImage(index: index);
                          })
                        : productImages(label: "${index + 1}").onTap(
                            () {
                              controller.pickImage(index: index);
                            },
                          ),
                  ),
                );
              }),
              5.heightBox,
              normalText(text: "*First image will your product image"),
              Divider(color: white),
              10.heightBox,
              boldText(text: "Choose product color:"),
              10.heightBox,
              Obx(() {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    12,
                    (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        VxBox()
                            .color(Vx.randomColor)
                            .size(45, 45)
                            .roundedFull
                            .make()
                            .onTap(() {
                          controller.selectedColorIndex.value = index;
                        }),
                        controller.selectedColorIndex.value == index
                            ? Icon(Icons.done, color: white)
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
