import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/customer_home_screen.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: Colors.white,
            indicatorColor: MyColors.lightPrimaryColor.withOpacity(0.4),
            elevation: 0,
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                    color: MyColors.darkPrimaryColor,
                  ),
                  label: 'Trang chủ'),
              NavigationDestination(
                  icon: Icon(
                    Icons.inventory_outlined,
                    color: MyColors.darkPrimaryColor,
                  ),
                  label: 'Đơn hàng'),
              NavigationDestination(
                  icon: Icon(
                    Icons.notifications_none,
                    color: MyColors.darkPrimaryColor,
                  ),
                  label: 'Thông báo'),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_outline,
                    color: MyColors.darkPrimaryColor,
                  ),
                  label: 'Tài khoản'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const CustomerHomeScreen(),
    Container(
      color: Colors.deepOrange,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}
