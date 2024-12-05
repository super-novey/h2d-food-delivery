import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/shippers/delivery/views/delivery_screen.dart';
import 'package:food_delivery_h2d/features/shippers/common/controllers/order_controller.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/formatter/formatter.dart';
import 'package:food_delivery_h2d/utils/helpers/status_helper.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';

class HistoryOrderTile extends StatelessWidget {
  final Order order;

  const HistoryOrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final OrderController ordersController = Get.find();

    return GestureDetector(
      onTap: () {
        Get.to(() => DeliveryScreen(order: order));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: MyColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: StatusHelper.getColor(
                      'driverStatus', order.driverStatus.toString()),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  StatusHelper.getTranslation(
                      'driverStatus', order.driverStatus.toString()),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  MyFormatter.formatCurrency(order.totalPrice ?? 0),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Lấy hàng: ${order.restaurantName}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    order.restAddress.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Divider(color: MyColors.dividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Giao hàng: ${order.customerName}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    order.custAddress.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
