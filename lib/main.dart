import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/app.dart';
import 'package:food_delivery_h2d/sockets/socket_service.dart';
import 'package:food_delivery_h2d/utils/constants/socket.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => SocketService().init(BaseUrlSocket.baseUrl));
  setPathUrlStrategy();
  runApp(const App());
}
