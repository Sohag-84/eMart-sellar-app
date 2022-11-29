// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/widgets/appbar_widget.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              50,
              (index) {
                return ListTile(
                  onTap: () {},
                  tileColor: textfieldGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: boldText(text: "234567676", color: purpleColor),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: fontGrey,
                          ),
                          10.widthBox,
                          boldText(
                            text: intl.DateFormat()
                                .add_yM()
                                .format(DateTime.now()),
                            color: fontGrey,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.payment,color: fontGrey),
                          10.widthBox,
                          boldText(text: unpaid,color: red)
                        ],
                      ),
                    ],
                  ),
                  trailing: boldText(text: "\$250",color: purpleColor,size: 16),
                ).box.margin(EdgeInsets.only(bottom: 8)).make();
              },
            ),
          ),
        ),
      ),
    );
  }
}
