import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/confirm_order/views/confirm_order_screen.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/cart_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/restaurant_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/detail_cart.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/detail_restaurant_screen.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/menu_restaurant_tile.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';
import 'package:get/get.dart';

class MenuRestaurantScreen extends StatelessWidget {
  final String userId;

  MenuRestaurantScreen({super.key, required this.userId});
  final RestaurantController restaurantController =
      Get.put(RestaurantController());

  final cartController = Get.put(CartController());

  void fetch() {
    restaurantController.setUserId(userId);
    restaurantController.fetchCategoriesAndItems();
    restaurantController.fetchDetailPartner(userId);
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Thực đơn'),
      ),
      body: Container(
        //color: MyColors.primaryBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                return Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          restaurantController.detailPartner.value?.avatarUrl ??
                              MyImagePaths.iconImage,
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {
                              Get.to(
                                  DetailRestaurantScreen(
                                    userId: userId,
                                  ),
                                  arguments:
                                      restaurantController.detailPartner.value);
                            },
                            icon: const Icon(
                              Icons.info_rounded,
                              color: MyColors.white,
                            )))
                  ],
                );
              }),
              const SizedBox(
                height: MySizes.md,
              ),
              Obx(() {
                return Column(
                  children: [
                    Text(
                        restaurantController.detailPartner.value?.userId.name ??
                            "",
                        style: const TextStyle(
                          color: MyColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingStars(
                          axis: Axis.horizontal,
                          value: 5,
                          onValueChanged: (v) {},
                          starCount: 5,
                          starSize: 12,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: false,
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: MyColors.starOffColor,
                          starColor: MyColors.starColor,
                          angle: 12,
                        ),
                        const SizedBox(
                          width: MySizes.xs,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: MySizes.xs / 2),
                          child: Text(
                            "5",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: MyColors.primaryTextColor),
                          ),
                        ),
                        const SizedBox(
                          width: MySizes.sm,
                        ),
                        Container(
                            color: MyColors.dividerColor,
                            width: 0.8,
                            height: 15),
                        const SizedBox(
                          width: MySizes.sm,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: MySizes.xs / 2),
                          child: Text(
                            "(999+ bình luận)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: MyColors.primaryTextColor),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: MySizes.xs),
                          child: Icon(Icons.arrow_forward_ios,
                              size: MySizes.iconXs),
                        )
                      ],
                    )
                  ],
                );
              }),
              const SizedBox(
                height: MySizes.md,
              ),
              Obx(() => restaurantController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: restaurantController.allCategories.length,
                      itemBuilder: (context, index) {
                        Category category =
                            restaurantController.allCategories[index];
                        List<Item> categoryItems = restaurantController
                            .getItemsForCategory(category.categoryId);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: MySizes.sm, left: MySizes.md),
                              child: Text(category.categoryName,
                                  style: const TextStyle(
                                    color: MyColors.darkPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  )),
                            ),
                            Column(
                              children: List.generate(categoryItems.length,
                                  (itemIndex) {
                                Item item = categoryItems[itemIndex];
                                return MenuRestaurantTile(item: item);
                              }),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: MySizes.sm,
                                  left: MySizes.lg,
                                  right: MySizes.lg),
                              child: Divider(color: MyColors.dividerColor),
                            )
                          ],
                        );
                      },
                    )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        if (cartController.totalItems == 0) return const SizedBox.shrink();
        return GestureDetector(
          onTap: () {
            Get.bottomSheet(DetailCart());
          },
          child: Container(
            padding: const EdgeInsets.all(MySizes.md),
            decoration: BoxDecoration(
              color: MyColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        size: 26,
                      ),
                      Positioned(
                        top: 0,
                        left: 16,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: MyColors.darkPrimaryTextColor,
                          child: Text(
                            cartController.totalItems.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: MyColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '${cartController.totalPrice}đ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: MyColors.darkPrimaryTextColor),
                ),
                const SizedBox(
                  width: MySizes.md,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ConfirmOrderScreen());
                  },
                  child: Text(
                    "Đặt hàng",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(
                          color: MyColors.darkPrimaryTextColor,
                          fontWeightDelta: 2,
                        )
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
