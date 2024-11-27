import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/header/primary_header.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/login_screen.dart';
import 'package:food_delivery_h2d/features/customers/home/widgets/customer_appbar.dart';
import 'package:food_delivery_h2d/features/customers/home/widgets/home_search_bar.dart';
import 'package:food_delivery_h2d/features/customers/home/widgets/image_place_holder.dart';
import 'package:food_delivery_h2d/features/customers/home/widgets/item_home.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/famous_restaurant_list/list_famous_restaurant.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/top_item_list/list_top_item.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/views/menu_list/menu_food_list_screen.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/views/order_list/order_list_screen.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/views/statistic_screen.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: MySizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Stack(
                children: [
                  SizedBox(
                    height: 160,
                    child: MyPrimaryHeaderContainer(
                      child: Column(
                        children: [
                          CustomerAppbar(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: HomeSearchBar()
                  ),
                ],
              ),
              const SizedBox(height: MySizes.defaultSpace,),
              const ImagePlaceHolder(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MySizes.spaceBtwItems),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: MySizes.spaceBtwItems - 6,
                  mainAxisSpacing: MySizes.spaceBtwItems,
                  children: [
                    ItemHome(
                      image: MyImagePaths.iconRice,
                      title: "Cơm",
                      onTap: () {
                        Get.to(const OrderListScreen());
                      },
                    ),
                    ItemHome(
                      title: "Bún",
                      image: MyImagePaths.iconVermicelli,
                      onTap: () {
                        Get.to(const MenuFoodListScreen());
                      },
                    ),
                    ItemHome(
                      image: MyImagePaths.iconPho,
                      title: "Phở",
                      onTap: () {
                        Get.to(const StatisticScreen());
                      },
                    ),
                    ItemHome(
                      image: MyImagePaths.iconNoodle,
                      title: "Mì",
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                    ),
                    ItemHome(
                      image: MyImagePaths.iconSnack,
                      title: "Ăn vặt",
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                    ),
                    ItemHome(
                      image: MyImagePaths.iconCake,
                      title: "Bánh ngọt",
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                    ),
                    ItemHome(
                      image: MyImagePaths.iconDrink,
                      title: "Trà sữa",
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                    ),
                    ItemHome(
                      image: MyImagePaths.iconJuice,
                      title: "Nước ép",
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MySizes.md, right: MySizes.md, top: MySizes.lg),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Món ngon bán chạy",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: MyColors.darkPrimaryTextColor,
                              ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "Xem tất cả",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      color: MyColors.darkPrimaryTextColor,
                                    ),
                              ),
                              const SizedBox(
                                width: MySizes.xs,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: MySizes.iconXs,
                                color: MyColors.darkPrimaryTextColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const ListTopItem(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MySizes.md, right: MySizes.md, top: MySizes.lg),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Nhà hàng có lượt đánh giá cao",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: MyColors.darkPrimaryTextColor,
                              ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "Xem tất cả",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      color: MyColors.darkPrimaryTextColor,
                                    ),
                              ),
                              const SizedBox(
                                width: MySizes.xs,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: MySizes.iconXs,
                                color: MyColors.darkPrimaryTextColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const ListFamousRestaurant(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
