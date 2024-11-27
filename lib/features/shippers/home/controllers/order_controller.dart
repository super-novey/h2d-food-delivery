import 'package:food_delivery_h2d/data/order/order_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/address_controller.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';

class OrdersController extends GetxController {
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
          await orderRepository.getOrdersByStatus(custStatus: "new");

      List<Order> ordersWithFullAddress = await Future.wait(
        fetchedOrders.map((order) async {
          order.fullAddress = await addressController.getFullAddress(
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
}
