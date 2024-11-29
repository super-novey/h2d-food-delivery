import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/common/widgets/keyboard/keyboard_hider.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/cart_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/order_controller.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:get/get.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());

    return KeyboardHider(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text('Xác nhận đơn hàng'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Restaurant Information
              buildInfoCard(
                context: context,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: MyColors.primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Địa chỉ giao hàng",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "LoginController.instance.currentUser.name",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "order.fullAddress ?? ''",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              // Customer Notes
              buildInfoCard(
                context: context,
                children: [
                  const Text(
                    'Ghi chú',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: orderController.noteController,
                    onChanged: (value) {
                      orderController.order.note = value;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      color: MyColors.primaryTextColor,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhập ghi chú...',
                    ),
                    maxLines: null,
                  ),
                ],
              ),
              // Order Details
              buildInfoCard(
                context: context,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Chi tiết đơn hàng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Divider(color: MyColors.dividerColor, thickness: 1),
                  const SizedBox(height: 8),
                  ...cartController.cartItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              item.itemName,
                              style: const TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              '${cartController.itemQuantities[item.itemName]}',
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${item.price}đ',
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const Divider(color: MyColors.dividerColor, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền: ',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryTextColor),
                      ),
                      Text(
                        '${cartController.orderPrice}đ',
                        style: const TextStyle(
                            fontSize: 14,
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text(
            'Đặt hàng',
            style: TextStyle(
              fontSize: 16,
              color: MyColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // icon: const Icon(
          //   Icons.check_circle,
          //   color: MyColors.white,
          // ),
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required BuildContext context,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
