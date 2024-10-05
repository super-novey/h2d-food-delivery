import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/header/wave_header.dart';
import 'package:food_delivery_h2d/common/widgets/images/image_text_image.dart';
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: MyVerticalImageText(
                                image: MyImagePaths.iconOrder,
                                //textColor: MyColors.darkPrimaryTextColor,
                                title: "Đơn\nhàng",
                                onTap: () {
                                  Get.to(const LoginScreen());
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: Center(
                              child: MyVerticalImageText(
                                  image: MyImagePaths.iconMenu,
                                  title: "Thực\nđơn",
                                  //textColor: MyColors.darkPrimaryTextColor,
                                  onTap: () {
                                    Get.to(() => const LoginScreen());
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: MyVerticalImageText(
                                image: MyImagePaths.iconStatistic,
                                title: "Thống\nkê",
                                //textColor: MyColors.darkPrimaryTextColor,
                                onTap: () {
                                  Get.to(const LoginScreen());
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: MyVerticalImageText(
                                image: MyImagePaths.iconSwitch,
                                title: "Mở/\nĐóng cửa",
                                //textColor: MyColors.darkPrimaryTextColor,
                                onTap: () {
                                  Get.to(const LoginScreen());
                                }),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
