import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/customers/confirm_order/models/order_model.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/controllers/order_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/views/order_list/widgets/history_order_tile.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/views/order_list/widgets/new_order_tile.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/views/order_list/widgets/preparing_order_tile.dart';
import 'package:food_delivery_h2d/features/restaurants/order_management/views/order_list/widgets/tab_item.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';
import 'package:food_delivery_h2d/sockets/socket_service.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../sockets/handlers/order_socket_handler.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    final orderHandler = OrderSocketHandler();

    orderHandler.joinOrderRoom(LoginController.instance.currentUser.partnerId);

    orderHandler.listenForOrderCreates((newOrder) {
      // Add the new order to the allOrders list
      orderController.allOrders.add(newOrder);
      print("Theeemm");
      // final order = Order.fromJson(newOrder);
    });

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Đơn hàng"),
        ),
        body: Obx(
          () => (orderController.isLoading.value)
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicatorPadding:
                          EdgeInsets.only(left: MySizes.sm, right: MySizes.sm),
                      tabs: [
                        TabItem(title: "Đơn mới"),
                        TabItem(title: "Đang chuẩn bị"),
                        TabItem(title: "Lịch sử"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // New orders list
                          ListView.builder(
                            itemCount: orderController.allOrders.length,
                            itemBuilder: (context, index) {
                              final order = orderController.allOrders[index];
                              return NewOrderTile(order: order);
                            },
                          ),
                          ListView.builder(
                              itemCount: orderController.allOrders.length,
                              itemBuilder: (context, index) {
                                final order = orderController.allOrders[index];
                                return PreparingOrderTile(order: order);
                              }),
                          ListView.builder(
                              itemCount: orderController.allOrders.length,
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
      ),
    );
  }
}
