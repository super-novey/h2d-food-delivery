import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/item_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/top_item_list/widgets/top_item_tile.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ListTopItem extends StatelessWidget {
  const ListTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemController());
    return SizedBox(
      height: 160,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.4,
              mainAxisSpacing: MySizes.xs),
          itemCount: itemController.items.length,
          itemBuilder: (context, index) {
            final item = itemController.items[index];
            return TopItemTile(item: item);
          }),
    );
  }
}
