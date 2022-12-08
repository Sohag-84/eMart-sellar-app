import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/profile_controller.dart';
import 'package:e_mart_seller/widgets/custom_textfield.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopSettingScreen extends StatelessWidget {
  const ShopSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: purpleColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: boldText(text: shopSetting, size: 16),
          actions: [
            TextButton(
              onPressed: () async {
                controller.isLoading(true);
                await controller.updatedShop(
                  shopName: controller.shopNameController.text,
                  shopAddress: controller.shopAdressController.text,
                  shopMobile: controller.shopMobileController.text,
                  shopWebsite: controller.shopWebsiteController.text,
                  shopDescription: controller.shopDescriptionController.text,
                );
                Fluttertoast.showToast(msg: 'Shop updated');
              },
              child: controller.isLoading.value
                  ? loadingIndicator(circleColor: white)
                  : normalText(text: save),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              customTextField(
                label: shopName,
                hintText: nameHint,
                controller: controller.shopNameController,
              ),
              10.heightBox,
              customTextField(
                label: shopAddress,
                hintText: shopAddressHint,
                controller: controller.shopAdressController,
              ),
              10.heightBox,
              customTextField(
                label: mobile,
                hintText: shopMobileHint,
                controller: controller.shopMobileController,
              ),
              10.heightBox,
              customTextField(
                label: website,
                hintText: shopWebsiteHint,
                controller: controller.shopWebsiteController,
              ),
              10.heightBox,
              customTextField(
                label: description,
                hintText: shopDescHint,
                isDesc: true,
                controller: controller.shopDescriptionController,
              ),
            ],
          ),
        ),
      );
    });
  }
}
