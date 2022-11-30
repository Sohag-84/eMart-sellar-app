// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: messages, size: 16, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: purpleColor,
                  child: Icon(Icons.person, color: white),
                ),
                title: boldText(text: username, color: fontGrey),
                subtitle: normalText(text: "Last messsage...", color: darkGrey),
                trailing: normalText(text: "9:20 PM", color: darkGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
