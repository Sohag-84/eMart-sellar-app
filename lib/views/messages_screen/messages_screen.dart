// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/services/firestore_services.dart';
import 'package:e_mart_seller/views/messages_screen/chat_screen.dart';
import 'package:e_mart_seller/widgets/loading_indicator.dart';
import 'package:intl/intl.dart' as intl;

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: darkGrey),
        title: boldText(text: messages, size: 16, color: fontGrey),
      ),
      body: StreamBuilder(
        stream: FirestroeServices.getMessages(uid: currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) {
                      var t = data[index]['created_on'] == null
                          ? DateTime.now()
                          : data[index]['created_on'].toDate();
                      var time = intl.DateFormat('h:mma').format(t);
                      return ListTile(
                        onTap: () {
                          Get.to(() => ChatScreen());
                        },
                        leading: CircleAvatar(
                          backgroundColor: purpleColor,
                          child: Icon(Icons.person, color: white),
                        ),
                        title: boldText(
                            text: "${data[index]['sender_name']}",
                            color: fontGrey),
                        subtitle: normalText(
                            text: "${data[index]['last_msg']}",
                            color: darkGrey),
                        trailing: normalText(text: time, color: darkGrey),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
