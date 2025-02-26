import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/favorite_list_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/models/top_item_model.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/menu_restaurant_screen.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class FavoriteTile extends StatelessWidget {
  final TopItemModel item;

  const FavoriteTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(MenuRestaurantScreen(userId: item.partnerId));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: MySizes.sm),
        child: Card(
          elevation: 2,
          shadowColor: MyColors.darkPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: MySizes.md),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius:
                          BorderRadius.circular(MySizes.borderRadiusMd),
                      child: CachedNetworkImage(
                        imageUrl: item.itemImage,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )),
                  const SizedBox(
                    height: MySizes.sm,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: MySizes.sm, bottom: MySizes.sm, left: MySizes.md, right: MySizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
crossAxisAlignment: CrossAxisAlignment.start,                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                item.itemName,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: MyColors.darkPrimaryTextColor),
                              ),
                            ),
                            const SizedBox(
                              height: MySizes.xs,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                item.description,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(color: MyColors.darkPrimaryTextColor),
                              ),
                            ),
                          ],
                        ),
                        LikeButton(
                          size: MySizes.iconMs,
                          animationDuration: const Duration(milliseconds: 500),
                          isLiked: FavoriteListController.instance.favoriteList
                              .any((fav) =>
                                  fav.id == item.id),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_outline_outlined,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: MySizes.iconMd,
                            );
                          },
                          onTap: (isLiked) async {
                            final controller = FavoriteListController.instance;
                            if (isLiked) {
                              await controller.removeFromFavorites(item.id);
                            } else {
                              await controller.addToFavorites(item.id);
                            }
                            return !isLiked;
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
