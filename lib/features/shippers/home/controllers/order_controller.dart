import 'package:food_delivery_h2d/data/order/order_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/address_controller.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find();

  var orders = <Order>[].obs; // Observable list of orders
  var isLoading = true.obs; // Observable for loading state
  OrderRepository orderRepository = Get.put(OrderRepository());
  final addressController = Get.put(AddressController());

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);

      // Fetch orders from the repository
      final fetchedOrders =
          await orderRepository.getOrdersByStatus(driverStatus: "waiting");

      List<Order> ordersWithFullAddress = await Future.wait(
        fetchedOrders.map((order) async {
          order.restAddress = await addressController.getFullAddress(
            order.restProvinceId,
            order.restDistrictId,
            order.restCommuneId,
            order.restDetailAddress,
          );
          return order;
        }),
      );

      orders.assignAll(ordersWithFullAddress);
      print(orders);
    } catch (e) {
      print("Error fetching orders: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateOrderStatus(
      String orderId, Map<String, dynamic> newStatus) async {
    try {
      await orderRepository.updateOrderStatus(orderId, newStatus);

      final orderIndex = orders.indexWhere((o) => o.id == orderId);
      if (orderIndex != -1) {
        orders[orderIndex].custStatus = newStatus['custStatus'];
        orders[orderIndex].driverStatus = newStatus['driverStatus'];
        orders[orderIndex].restStatus = newStatus['restStatus'];
        orders.refresh();
      }
      Get.snackbar("Success", "Order status updated successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print("Error updating order status: $e");
      Get.snackbar("Error", "Failed to update order status",
          snackPosition: SnackPosition.BOTTOM);
      rethrow; // Re-throw to notify the UI if needed
    }
  }
}
