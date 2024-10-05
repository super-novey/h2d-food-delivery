import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/header/wave_header.dart';
import 'package:food_delivery_h2d/common/widgets/item_menu/item_menu.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/login_screen.dart';
import 'package:food_delivery_h2d/features/restaurants/home/widgets/restaurant_home_appbar.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class RestaurantHomeScreen extends StatelessWidget {
  const RestaurantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 300,
              child: WaveHeader(
                  child: Column(
                children: [
                  MyHomeAppBar(),
                ],
              )),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MySizes.spaceBtwItems),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: MySizes.spaceBtwItems,
                  mainAxisSpacing: MySizes.spaceBtwItems,
                  children: [
                    ItemMenu(
                          image: MyImagePaths.iconOrder,
                          title: "Đơn hàng",
                          onTap: () {
                            Get.to(const LoginScreen());
                          }),
                        ItemMenu(
                          title: "Thực đơn",
                          image: MyImagePaths.iconMenu,
                          onTap: () {
                            Get.to(const LoginScreen());
                          },
                        ),
                        ItemMenu(
                            image: MyImagePaths.iconStatistic,
                            title: "Thống kê",
                            onTap: () {
                              Get.to(const LoginScreen());
                            }),
                        ItemMenu(
                            image: MyImagePaths.iconSwitch,
                            title: "Mở/Đóng cửa",
                            onTap: () {
                              Get.to(const LoginScreen());
                            }),
                  ],))
          ],
        ),
      ),
    );
  }
}
