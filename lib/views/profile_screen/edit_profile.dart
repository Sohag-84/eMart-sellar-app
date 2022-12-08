// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:io';

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/profile_controller.dart';
import 'package:e_mart_seller/widgets/custom_textfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  final String username;
  const EditProfileScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    controller.nameController.text = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: editProfile, size: 16),
          actions: [
            TextButton(
                onPressed: () async {
                  controller.isLoading(true);

                  //if image is not selected
                  if (controller.profileImagePath.value.isNotEmpty) {
                    await controller.uploadProfileImage();
                  } else {
                    controller.profileImageLink = controller.snapshot['img'];
                  }

                  //if old password matches database
                  if (controller.snapshot['password'] ==
                      controller.oldPasswordController.text) {
                    await controller.changeAuthPassword(
                      email: controller.snapshot['email'],
                      password: controller.oldPasswordController.text,
                      newPassword: controller.newPasswordController.text,
                    );

                    await controller.updatedProfile(
                      name: controller.nameController.text,
                      password: controller.newPasswordController.text,
                      imageUrl: controller.profileImageLink,
                    );

                    Fluttertoast.showToast(msg: "Updated");
                  } else if (controller
                          .oldPasswordController.text.isEmptyOrNull &&
                      controller.newPasswordController.text.isEmptyOrNull) {
                    await controller.updatedProfile(
                      name: controller.nameController.text,
                      password: controller.snapshot['password'],
                      imageUrl: controller.profileImageLink,
                    );
                    Fluttertoast.showToast(msg: "Updated");

                  } else {
                    Fluttertoast.showToast(msg: "Wrong old password");
                    controller.isLoading(false);
                  }
                },
                child: normalText(text: save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                controller.snapshot['img'] == '' &&
                        controller.profileImagePath.isEmpty
                    ? Image.asset(
                        imgProduct,
                        width: 250,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : controller.snapshot['img'] != '' &&
                            controller.profileImagePath.isEmpty
                        ? Image.network(
                            controller.snapshot['img'].toString(),
                            width: 250,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImagePath.value),
                            width: 250,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ElevatedButton(
                  onPressed: () {
                    controller.changeImage();
                  },
                  child: normalText(text: changeImage, color: darkGrey),
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                ),
                10.heightBox,
                Divider(color: white),
                10.heightBox,
                customTextField(
                  label: username,
                  hintText: nameHint,
                  controller: controller.nameController,
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Change your password"),
                ),
                5.heightBox,
                customTextField(
                  label: password,
                  hintText: passwordHint,
                  controller: controller.oldPasswordController,
                ),
                10.heightBox,
                customTextField(
                  label: confirmPassword,
                  hintText: passwordHint,
                  controller: controller.newPasswordController,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
