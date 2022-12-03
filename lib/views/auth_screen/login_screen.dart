// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/auth_controller.dart';
import 'package:e_mart_seller/views/home.dart';
import 'package:e_mart_seller/widgets/custom_button.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: purpleColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18),
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    icLogo,
                    height: 70,
                    width: 70,
                  ).box.rounded.border(color: white).p8.make(),
                  14.widthBox,
                  normalText(text: appname, size: 20)
                ],
              ),
              30.heightBox,
              normalText(text: loginTo, size: 18),
              10.heightBox,
              Obx(() {
                return Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: purpleColor,
                        ),
                        hintText: emailHint,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    10.heightBox,
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: purpleColor,
                        ),
                        hintText: passwordHint,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: null,
                        child: normalText(
                            text: forgotPassword, color: purpleColor),
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth - 100,
                      child: customButton(
                        isLoading: controller.isLoading.value,
                        title: login,
                        onPressed: () async {
                          controller.isLoading(true);
                          await controller.loginMethod().then(
                            (value) {
                              if (value != null) {
                                Fluttertoast.showToast(msg: "Logged in");
                                Get.offAll(() => Home());
                                controller.isLoading(false);
                              } else {
                                controller.isLoading(false);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ).box.rounded.p12.white.make();
              }),
              10.heightBox,
              Center(child: normalText(text: anyProblem, color: lightGrey)),
              Spacer(),
              Center(child: boldText(text: credit)),
            ],
          ),
        ),
      ),
    );
  }
}
