import 'package:food_delivery_h2d/data/order/order_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/address_controller.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
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
    String? driverId, {
    required String orderId,
    required Map<String, dynamic> newStatus,
  }) async {
    try {
      await orderRepository.updateOrderStatus(orderId, driverId, newStatus);

      final orderIndex = orders.indexWhere((o) => o.id == orderId);
      if (orderIndex != -1) {
        orders[orderIndex].custStatus = newStatus['custStatus'];
        orders[orderIndex].driverStatus = newStatus['driverStatus'];
        orders[orderIndex].restStatus = newStatus['restStatus'];
        orders[orderIndex].assignedShipperId = driverId;
        orders.refresh();
      }
      Loaders.successSnackBar(
          title: "Thành công!",
          message: "Trạng thái đơn hàng đã được cập nhật.");
    } catch (e) {
      print("Error updating order status: $e");
      Loaders.errorSnackBar(title: "Thất bại!", message: "Đã xảy ra lỗi.");
      rethrow;
    }
  }
}
