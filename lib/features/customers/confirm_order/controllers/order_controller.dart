import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/cart_controller.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final TextEditingController noteController = TextEditingController();
  final cartController = CartController.instance;
  late final Order order;

  @override
  void onInit() {
    super.onInit();
    order = Order(
      custStatus: "waiting",
      customerName: "LoginController.instance.currentUser.name",
      restaurantName: '',
      deliveryFee: cartController.deliveryFee,
    );
    noteController.text = order.note;
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
