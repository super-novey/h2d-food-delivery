import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/app.dart';
import 'package:food_delivery_h2d/restaurant_order_page.dart';
import 'package:food_delivery_h2d/socket_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setPathUrlStrategy();
  runApp(const App());

  // final socketService = SocketService();
  // socketService.initializeSocket('http://localhost:8081');

  // runApp(MaterialApp(
  //   home: RestaurantOrdersPage(
  //     socketService: socketService,
  //     restaurantId:
  //         '6747d353fe9fcecfdc995f2b', // Replace with the actual restaurant ID
  //   ),
  // ));
}
