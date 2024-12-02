import 'package:food_delivery_h2d/data/order/order_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:get/get.dart';
import '../../../authentication/controllers/address_controller.dart';
import '../../../shippers/home/models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  var isLoading = false.obs;
  final List<Order> allOrders = <Order>[].obs;

  final _orderRespository = Get.put(OrderRepository());
  final addressController = Get.put(AddressController());

  @override
  void onInit() async {
    fetchOrders();
    super.onInit();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);

      // Fetch orders from the repository
      final fetchedOrders = await _orderRespository.getOrdersByPartnerStatus(
          LoginController.instance.currentUser.partnerId, "new");

      List<Order> ordersWithFullAddress = await Future.wait(
        fetchedOrders.data!.map((order) async {
          order.restAddress = await addressController.getFullAddress(
            order.restProvinceId,
            order.restDistrictId,
            order.restCommuneId,
            order.restDetailAddress,
          );
          return order;
        }),
      );

      allOrders.assignAll(ordersWithFullAddress);
    } catch (e) {
      print("Error fetching orders: $e");
    } finally {
      isLoading(false);
    }
  }
}
