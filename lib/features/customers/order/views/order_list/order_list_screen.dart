import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/order/controllers/order_controller.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/history_order_tile_cancelled.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/history_order_tile_delivered.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/new_order_tile.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/tab_item.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CustomerOrderListScreen extends StatelessWidget {
  const CustomerOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(CustomerOrderController());
    orderController.fetchAllOrders();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Đơn hàng"),
          showBackArrow: false,
        ),
        body: Column(
          children: [
            const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicatorPadding:
                  EdgeInsets.only(left: MySizes.sm, right: MySizes.sm),
              tabs: [
                TabItem(title: "Đang đến"),
                TabItem(title: "Lịch sử"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Obx(() {
                    if (orderController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final historyOrders = orderController.orders
                        .where((order) =>
                            order.custStatus == 'waiting' ||
                            order.custStatus == 'heading_to_rest' ||
                            order.custStatus == 'preparing' ||
                            order.custStatus == 'delivering')
                        .toList();

                    if (historyOrders.isEmpty) {
                      return const Center(
                          child: Text("Không có lịch sử đơn hàng!"));
                    }

                    return ListView.builder(
                      itemCount: historyOrders.length,
                      itemBuilder: (context, index) {
                        final order = historyOrders[index];
                        return NewOrderTile(order: order);
                      },
                    );
                  }),
                  Obx(() {
                    if (orderController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final historyOrders = orderController.orders
                        .where((order) =>
                            order.custStatus == 'delivered' ||
                            order.custStatus == 'cancelled')
                        .toList();

                    if (historyOrders.isEmpty) {
                      return const Center(
                          child: Text("Không có lịch sử đơn hàng!"));
                    }

                    return ListView.builder(
                      itemCount: historyOrders.length,
                      itemBuilder: (context, index) {
                        final order = historyOrders[index];
                        if (order.custStatus == 'delivered') {
                          return HistoryOrderTileDelivered(order: order);
                        }
                        else {
                          return HistoryOrderTileCancelled(order: order);
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
