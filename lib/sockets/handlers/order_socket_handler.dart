import 'dart:convert';
import 'package:food_delivery_h2d/sockets/socket_service.dart';
import 'package:get/get.dart';

import '../../features/shippers/home/models/order_model.dart';
import '../../utils/constants/socket.dart';

class OrderSocketHandler {
  final _socketService = SocketService.instance;

  void listenForOrderCreates(Function(Order order) onNewOrder) {
    _socketService.socket.on('order:new', (data) {
      // final order = jsonDecode(jsonEncode(data));
      final orderData = jsonDecode(jsonEncode(data));
      final order = Order.fromJson(orderData);
      onNewOrder(order);
      print('New order received: $order');
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
