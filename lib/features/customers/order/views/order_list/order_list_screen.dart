import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/order/controllers/order_controller.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/history_order_tile.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/new_order_tile.dart';
import 'package:food_delivery_h2d/features/customers/order/views/order_list/widgets/tab_item.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CustomerOrderListScreen extends StatelessWidget {
  const CustomerOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
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
                  ListView.builder(
                    itemCount: orderController.allOrders.length,
                    itemBuilder: (context, index) {
                      final order = orderController.allOrders[index];
                      return NewOrderTile(order: order);
                    },
                  ),
                  ListView.builder(itemCount: orderController.allOrders.length,
                  itemBuilder: (context, index) {
                    final order = orderController.allOrders[index];
                    return HistoryOrderTile(order: order);
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