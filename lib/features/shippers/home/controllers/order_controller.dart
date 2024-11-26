import 'package:food_delivery_h2d/data/order/order_repository.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';

class OrdersController extends GetxController {
  var orders = <Order>[].obs; // Observable list of orders
  var isLoading = true.obs; // Observable for loading state
  OrderRepository orderRepository = Get.put(OrderRepository());
  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);
      final fetchedOrders =
          await OrderRepository.instance.getOrdersByStatus(custStatus: "new");
      orders.assignAll(fetchedOrders);
      print(orders);
    } catch (e) {
      print("Error fetching orders: $e");
    } finally {
      isLoading(false);
    }
  }
}
