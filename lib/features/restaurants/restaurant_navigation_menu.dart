import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/restaurants/home/restaurant_home_screen.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// class RestaurantNavigationMenu extends StatelessWidget {
//   const RestaurantNavigationMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//             selectedIndex: controller.selectedIndex.value,
//             onDestinationSelected: (index) =>
//                 controller.selectedIndex.value = index,
//             backgroundColor: Colors.white,
//             indicatorColor: MyColors.lightPrimaryColor.withOpacity(0.4),
//             elevation: 0,
//             destinations: const [
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.home_outlined,
//                     color: MyColors.darkPrimaryColor,
//                   ),
//                   label: 'Trang chủ'),
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.inventory_outlined,
//                     color: MyColors.darkPrimaryColor,
//                   ),
//                   label: 'Đơn hàng'),
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.fastfood_outlined,
//                     color: MyColors.darkPrimaryColor,
//                   ),
//                   label: 'Thực đơn',),
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.person_outlined,
//                     color: MyColors.darkPrimaryColor,
//                   ),
//                   label: 'Tài khoản'),
//             ]),
//       ),
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }

class RestaurantNavigationMenu extends StatelessWidget {
  const RestaurantNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          color: MyColors.darkPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical:8),
            child: GNav(
              backgroundColor: MyColors.darkPrimaryColor,
              activeColor: Colors.white,
              tabBackgroundColor: MyColors.lightPrimaryColor,
              rippleColor: Colors.white,
              hoverColor: Colors.white,
              gap: 8,
              padding: const EdgeInsets.all(MySizes.defaultSpace/2),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  text: 'Trang chủ',
                ),
                GButton(
                  icon: Icons.inventory_outlined,
                  text: 'Đơn hàng',
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: Icons.fastfood_outlined,
                  text: 'Thực đơn',
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: Icons.person_outlined,
                  text: 'Tài khoản',
                  iconColor: Colors.white,
                ),
              ],
              onTabChange: (index) {
                controller.selectedIndex.value = index;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const RestaurantHomeScreen(),
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