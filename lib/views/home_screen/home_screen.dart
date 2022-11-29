// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/widgets/dashboard_button.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: normalText(
              text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
              color: purpleColor,
            ),
          ),
          12.widthBox,
        ],
        title: boldText(text: dahsboard, color: fontGrey, size: 19),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardButton(
                  context: context,
                  title: dahsboard,
                  quantity: "79",
                  icon: icProducts,
                ),
                dashboardButton(
                  context: context,
                  title: orders,
                  quantity: "30",
                  icon: icOrders,
                ),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardButton(
                  context: context,
                  title: rating,
                  quantity: "10",
                  icon: icStar,
                ),
                dashboardButton(
                  context: context,
                  title: totalSells,
                  quantity: "30",
                  icon: icOrders,
                ),
              ],
            ),
            10.heightBox,
            Divider(color: darkGrey),
            10.heightBox,
            boldText(text: popularProducts, color: fontGrey, size: 16),
            20.heightBox,
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: List.generate(
                  10,
                  (index) {
                    return ListTile(
                      leading: Image.asset(
                        imgProduct,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: boldText(text: "Product title", color: fontGrey),
                      subtitle: normalText(text: "\$40", color: darkGrey),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
