// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/views/profile_screen/edit_profile.dart';
import 'package:e_mart_seller/views/shop_screen/shop_settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfileScreen());
              },
              icon: Icon(Icons.edit)),
          TextButton(onPressed: () {}, child: normalText(text: logout))
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgProduct)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            title: boldText(text: "Vendor Name"),
            subtitle: normalText(text: "vendor@gmail.com"),
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(color: darkGrey),
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                profileButtonIconList.length,
                (index) => ListTile(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Get.to(() => ShopSettingScreen());
                        break;
                      default:
                    }
                  },
                  leading: Icon(
                    profileButtonIconList[index],
                    color: white,
                  ),
                  title: normalText(text: profileButtonTitleList[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
