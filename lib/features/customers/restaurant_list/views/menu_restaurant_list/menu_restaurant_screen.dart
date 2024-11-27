import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/restaurant_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/detail_restaurant_screen.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/menu_restaurant_tile.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class MenuRestaurantScreen extends StatelessWidget {
  final String userId;

  const MenuRestaurantScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.put(RestaurantController());
    restaurantController.setUserId(userId);

    restaurantController.fetchCategoriesAndItems();
    restaurantController.fetchDetailPartner(userId);

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Thực đơn'),
      ),
      body: Container(
        color: MyColors.primaryBackgroundColor,
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

                          },
                          icon: const Icon(
                            Icons.info_rounded,
                            color: MyColors.white,
                          )))
                ],
              );
            }),
            const SizedBox(
              height: MySizes.sm,
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
                        padding: const EdgeInsets.only(top: MySizes.xs),
                        child:
                            Icon(Icons.arrow_forward_ios, size: MySizes.iconXs),
                      )
                    ],
                  )
                ],
              );
            }),
            Expanded(
              child: Obx(
                () {
                  if (restaurantController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
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
                                left: MySizes.sm,
                                right: MySizes.sm),
                            child: Divider(color: MyColors.dividerColor),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
