import 'package:food_delivery_h2d/features/restaurants/order_management/models/order_item_model.dart';
import 'package:get/get.dart';

import '../../../shippers/home/models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final List<Order> allOrders = <Order>[].obs;
  // final List<OrderItem> orderItems = [
  //   OrderItem(orderItemId: 1, orderId: 1, itemId: 3, quantity: 1),
  //   OrderItem(orderItemId: 2, orderId: 1, itemId: 4, quantity: 2),
  //   OrderItem(orderItemId: 3, orderId: 2, itemId: 5, quantity: 1),
  //   OrderItem(orderItemId: 4, orderId: 3, itemId: 6, quantity: 3),
  // ];
}
