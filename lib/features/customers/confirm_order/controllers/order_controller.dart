import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/order/order_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/customers/confirm_order/models/order_item_model.dart';
import 'package:food_delivery_h2d/features/customers/confirm_order/models/order_model.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/cart_controller.dart';
import 'package:food_delivery_h2d/features/customers/restaurant_list/controllers/restaurant_controller.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final TextEditingController noteController = TextEditingController();
  final orderRepository = Get.put(OrderRepository());
  final cartController = CartController.instance;
  late final OrderModel order;
  double deliveryFee = 15000;

  @override
  void onInit() {
    super.onInit();
    order = OrderModel(orderItems: []);
    noteController.text = order.note;
    handleNoteOnChange();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  handleNoteOnChange() {
    noteController.addListener(() {
      order.note = noteController.text;
    });
  }

  void convertCartItemToOrderItem() {
    order.orderItems.clear();
    for (var cartItem in cartController.cartItems) {
      order.orderItems.add(OrderItem(
        itemName: cartItem.itemName,
        price: cartItem.price,
        quantity: cartController.itemQuantities[cartItem.itemName] ?? 0,
        totalPrice: 1.0 *
            cartItem.price *
            cartController.itemQuantities[cartItem.itemName]!,
        itemId: cartItem.itemId,
      ));
    }
  }

  void placeOrder() {
    convertCartItemToOrderItem();
    OrderModel newOrder = OrderModel(
      custAddress: order.custAddress,
      customerId: LoginController.instance.currentUser.userId,
      restaurantId: RestaurantController.instance.userId,
      deliveryFee: deliveryFee,
      orderItems: order.orderItems,
      totalPrice: order.totalPrice,
    );
    print(newOrder.toString());
    orderRepository.placeOrder(newOrder);
  }
}
