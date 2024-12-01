
import 'package:food_delivery_h2d/features/customers/order/models/order_item_model.dart';
import 'package:food_delivery_h2d/features/customers/order/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final List<OrderModel> allOrders = [
    OrderModel(
      orderId: 1455324234,
      customerId: 101,
      restaurantId: 201,
      assignedShipperId: 301,
      custShipperRating: 4.5,
      deliveryFeedback: 'Giao hàng nhanh chóng!',
      orderDateTime: DateTime.now().subtract(const Duration(hours: 1)),
      note: 'Xin vui lòng để ý đến đồ ăn',
      orderItems: [
        
      ],
    ),
    OrderModel(
      orderId: 21455324234,
      customerId: 102,
      restaurantId: 202,
      assignedShipperId: 302,
      custShipperRating: 3.8,
      deliveryFeedback: 'Đồ ăn không được nóng',
      orderDateTime: DateTime.now().subtract(const Duration(days: 1)),
      note: 'Đã thanh toán bằng thẻ',
      orderItems: [
        
      ],
    ),
    OrderModel(
      orderId: 31455324234,
      customerId: 103,
      restaurantId: 203,
      assignedShipperId: 303,
      custShipperRating: 5.0,
      deliveryFeedback: 'Rất hài lòng với dịch vụ!',
      orderDateTime: DateTime.now().subtract(const Duration(days: 2)),
      note: 'Chúc các bạn làm ăn phát đạt!',
      orderItems: [
        
      ],
    ),
    OrderModel(
      orderId: 314553344324234,
      customerId: 103,
      restaurantId: 203,
      assignedShipperId: 303,
      custShipperRating: 5.0,
      deliveryFeedback: 'Rất hài lòng với dịch vụ!',
      orderDateTime: DateTime.now().subtract(const Duration(days: 2)),
      note: 'Chúc các bạn làm ăn phát đạt!',
      orderItems: [
       
      ],
    ),
  ];
  final List<OrderItem> orderItems = [
    OrderItem(orderItemId: 1, orderId: 1, itemId: 3, quantity: 1),
    OrderItem(orderItemId: 2, orderId: 1, itemId: 4, quantity: 2),
    OrderItem(orderItemId: 3, orderId: 2, itemId: 5, quantity: 1),
    OrderItem(orderItemId: 4, orderId: 3, itemId: 6, quantity: 3),
  ];
}