import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/cart_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/views/menu_restaurant_list/widgets/cart_item_tile.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class DetailCart extends StatelessWidget {
  final cartController = Get.put(CartController());
  DetailCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: MySizes.md, bottom: MySizes.sm, left: MySizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      cartController.removeAllItem();
                    },
                    child: const Text(
                      "Xóa tất cả",
                      style: TextStyle(
                          fontSize: 12, color: MyColors.darkPrimaryTextColor),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "Giỏ hàng",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Obx(() {
            return Column(
              children: cartController.cartItems.map((item) {
                var quantity =
                    cartController.itemQuantities[item.itemName] ?? 1;
                return CartItemTile(
                  item: item,
                  quantity: quantity,
                  onRemove: () {
                    cartController.removeFromCart(item);
                  },
                  onAdd: () {
                    cartController.addToCart(item);
                  },
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
