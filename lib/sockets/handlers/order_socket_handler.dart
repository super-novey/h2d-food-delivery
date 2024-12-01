import 'dart:convert';
import 'package:food_delivery_h2d/sockets/socket_service.dart';
import 'package:get/get.dart';

import '../../features/shippers/home/models/order_model.dart';
import '../../utils/constants/socket.dart';

class OrderSocketHandler {
  final _socketService = SocketService.instance;

  void listenForOrderCreates(Function(Order order) onNewOrder) {
    _socketService.socket.on('order:new', (data) {
      final orderData = jsonDecode(jsonEncode(data));
      final order = Order.fromJson(orderData);
      onNewOrder(order);
    });
  }

  void listenForOrderUpdates(Function(Order order) onOrderUpdated) {
    _socketService.socket.on('order:updated', (data) {
      final orderData = jsonDecode(jsonEncode(data));
      final order = Order.fromJson(orderData);
      onOrderUpdated(order);
      print('Order updated: $order');
    });
  }

  void joinOrderRoom(String room) {
    _socketService.socket.emit('joinRoom', room);
    print('Joined room: $room');
  }

  // Clean up listeners
  void cleanUp() {
    _socketService.socket.off('order:new');
  }
}
