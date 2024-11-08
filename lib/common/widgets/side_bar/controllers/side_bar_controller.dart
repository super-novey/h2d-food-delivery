import 'package:food_delivery_h2d/routes/routes.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  final activeItem = Routes.dashboard.obs;
  final hoverItem = ''.obs;

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoverItem(String route) {
    if(!isActive(route)) {
      hoverItem.value = route;
    }
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if(!isActive(route)) {
      changeActiveItem(route);
      Get.toNamed(route);
    }
  }
}
