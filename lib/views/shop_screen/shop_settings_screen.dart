import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/widgets/custom_textfield.dart';

class ShopSettingScreen extends StatelessWidget {
  const ShopSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: boldText(text: shopSetting, size: 16),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            customTextField(label: shopName, hintText: nameHint),
            10.heightBox,
            customTextField(label: shopAddress, hintText: shopAddressHint),
            10.heightBox,
            customTextField(label: mobile, hintText: shopMobileHint),
            10.heightBox,
            customTextField(label: website, hintText: shopWebsiteHint),
            10.heightBox,
            customTextField(
              label: description,
              hintText: shopDescHint,
              isDesc: true,
            ),
          ],
        ),
      ),
    );
  }
}
