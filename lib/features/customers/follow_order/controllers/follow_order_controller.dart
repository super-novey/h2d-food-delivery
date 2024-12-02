import 'package:food_delivery_h2d/features/customers/confirm_order/controllers/order_controller.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';

class FollowOrderController extends GetxController {
  static FollowOrderController get instance => Get.find();
  final OrderController orderController = Get.find();

  late Order order; // Observable order

  var isLoading = true.obs;
  var isButtonClicked = false.obs; // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments['order'];
    // fetchOrder();
  }
}
