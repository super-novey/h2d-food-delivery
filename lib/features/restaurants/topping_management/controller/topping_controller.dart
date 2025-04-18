import 'package:food_delivery_h2d/features/restaurants/topping_management/dummy/toppings.dart';
import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_group_entity.dart';
import 'package:get/get.dart';

class ToppingController extends GetxController {
  var toppingGps = <ToppingGroupEntity>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await getToppingsGps();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> getToppingsGps() async {
    // TODO: call api để lấy danh sách các toppingGrps
    toppingGps.addAll(fakeToppingGroups);
  }
}
