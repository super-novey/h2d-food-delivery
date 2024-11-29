import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/cart_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';
import 'package:get/get.dart';

class MenuRestaurantTile extends StatelessWidget {
  final Item item;

  const MenuRestaurantTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.only(
          left: MySizes.sm, right: MySizes.sm, top: MySizes.sm),
      child: SizedBox(
        height: 120,
        child: Card(
          elevation: 4,
          shadowColor: MyColors.darkPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(
                top: MySizes.sm,
                left: MySizes.md,
                bottom: MySizes.sm,
                right: MySizes.sm),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(MySizes.borderRadiusMd),
                    child: CachedNetworkImage(
                      imageUrl: item.itemImage,
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                const SizedBox(
                  width: MySizes.spaceBtwItems,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.itemName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: MyColors.primaryTextColor),
                      ),
                      const SizedBox(
                        height: MySizes.xs,
                      ),
                      Text(
                        item.description,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: MyColors.secondaryTextColor),
                      ),
                      const SizedBox(
                        height: MySizes.xs,
                      ),
                      Row(
                        children: [
                          Text(
                            "Còn lại: ${item.quantity.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(color: MyColors.primaryTextColor),
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
                          Text(
                            "Đã bán: ${item.quantity.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(color: MyColors.primaryTextColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: MySizes.xs,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: MySizes.sm),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              MyFormatter.formatCurrency(item.price),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: MyColors.darkPrimaryTextColor),
                            ),
                            InkWell(
                              onTap: () {
                                cartController.addToCart(item);
                              },
                              child: const Icon(
                                Icons.add_box,
                                color: MyColors.darkPrimaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
