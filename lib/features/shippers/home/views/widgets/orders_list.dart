import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/shippers/home/controllers/order_controller.dart';
import 'package:food_delivery_h2d/features/shippers/home/views/widgets/order_tile.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersController controller = Get.put(OrdersController());
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (controller.orders.isEmpty) {
    //     controller.fetchOrders();
    //   }
    // });

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            color: MyColors.primaryBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.orders.isEmpty) {
              return const Center(child: Text("No orders available"));
            }

            return ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: controller.orders.length,
              itemBuilder: (context, index) {
                return OrderTile(order: controller.orders[index]);
              },
            );
          }),
        );
      },
    );
  }
}
