// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/auth_controller.dart';
import 'package:e_mart_seller/controllers/profile_controller.dart';
import 'package:e_mart_seller/services/firestore_services.dart';
import 'package:e_mart_seller/views/auth_screen/login_screen.dart';
import 'package:e_mart_seller/views/messages_screen/messages_screen.dart';
import 'package:e_mart_seller/views/profile_screen/edit_profile.dart';
import 'package:e_mart_seller/views/shop_screen/shop_settings_screen.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: settings, size: 16),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => EditProfileScreen(
                        username: controller.snapshot['vendor_name'],
                      ));
                },
                icon: Icon(Icons.edit)),
            TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod();
                Get.offAll(() => LoginScreen());
              },
              child: normalText(text: logout),
            ),
          ],
        ),
        body: FutureBuilder(
          future: FirestroeServices.getUserProfile(uid: currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator(circleColor: white);
            } else {
              controller.snapshot = snapshot.data!.docs[0];
              return Column(
                children: [
                  ListTile(
                    leading: controller.snapshot['img'] == ''
                        ? Image.asset(
                            imgProduct,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.network(
                            controller.snapshot['img'].toString(),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                    title:
                        boldText(text: "${controller.snapshot['vendor_name']}"),
                    subtitle:
                        normalText(text: "${controller.snapshot['email']}"),
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
                              case 1:
                                Get.to(() => MessagesScreen());
                                break;
                              default:
                            }
                          },
                          leading: Icon(
                            profileButtonIconList[index],
                            color: white,
                          ),
                          title:
                              normalText(text: profileButtonTitleList[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
