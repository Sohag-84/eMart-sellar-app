// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/home_controller.dart';
import 'package:e_mart_seller/views/home_screen/home_screen.dart';
import 'package:e_mart_seller/views/orders_screen/order_screen.dart';
import 'package:e_mart_seller/views/products/products_screen.dart';
import 'package:e_mart_seller/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  var controller = Get.put(Homecontroller());

  final navScreen = [
    HomeScreen(),
    ProductsScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
         () {
          return BottomNavigationBar(
            selectedItemColor: purpleColor,
            unselectedItemColor: darkGrey,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.navIndex.value,
            onTap: (index) {
              controller.navIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: dahsboard,),
              BottomNavigationBarItem(
                icon: Image.asset(
                  icProducts,
                  width: 22,
                  color: darkGrey,
                ),
                label: products,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  icOrders,
                  width: 22,
                  color: darkGrey,
                ),
                label: orders,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  icGeneralSetting,
                  width: 22,
                  color: darkGrey,
                ),
                label: settings,
              ),
            ],
          );
        }
      ),
      body: Obx(
         () {
          return Column(
            children: [
            Expanded(child: navScreen.elementAt(controller.navIndex.value))
            ],
          );
        }
      ),
    );
  }
}
