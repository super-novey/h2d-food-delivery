import 'package:food_delivery_h2d/bindings/network_manager.dart';
import 'package:food_delivery_h2d/data/driver/driver_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/shippers/income/models/income_model.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {
  static IncomeController get instance => Get.find();
  var selectedFilter = 0.obs;
  var value = 0.0.obs;
  var count = 0.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final _repository = DriverRepository();
  var incomeData = Rx<IncomeModel?>(null);
  var touchedIndex = Rx<int>(-1);

  void updateTouchedIndex(int index) {
    touchedIndex.value = index;
  }

  @override
  void onInit() async {
    await fetchIncome();
    super.onInit();
  }

  Future<void> fetchIncome() async {
    try {
      isLoading(true);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        errorMessage.value = "No internet connection";
        return;
      }

      final data = await _repository
          .fetchIncomeDriver(LoginController.instance.currentUser.driverId);
      incomeData.value = data;
    } catch (e) {
      errorMessage.value = "Error fetching driver details: ${e.toString()}";
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
