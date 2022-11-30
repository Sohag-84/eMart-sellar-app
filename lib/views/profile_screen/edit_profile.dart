// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/widgets/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile, size: 16),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(imgProduct)
                  .box
                  .width(180)
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              10.heightBox,
              ElevatedButton(
                onPressed: () {},
                child: normalText(text: changeImage, color: darkGrey),
                style: ElevatedButton.styleFrom(backgroundColor: white),
              ),
              10.heightBox,
              Divider(color: white),
              10.heightBox,
              customTextField(label: username, hintText: nameHint),
              10.heightBox,
              customTextField(label: password, hintText: passwordHint),
              10.heightBox,
              customTextField(label: confirmPassword, hintText: passwordHint),
            ],
          ),
        ),
      ),
    );
  }
}
