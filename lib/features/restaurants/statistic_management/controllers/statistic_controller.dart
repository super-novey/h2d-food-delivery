import 'package:food_delivery_h2d/bindings/network_manager.dart';
import 'package:food_delivery_h2d/data/partner/partner_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/restaurants/statistic_management/models/statistic_model.dart';
import 'package:get/get.dart';

class StatisticController extends GetxController {
  static StatisticController get instance => Get.find();
  var selectedFilter = 0.obs;
  var value = 0.0.obs;
  var count = 0.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final _repository = PartnerRepository();
  var incomeData = Rx<StatisticModel?>(null);
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
          .fetchStatistic(LoginController.instance.currentUser.partnerId);
      incomeData.value = data;
    } catch (e) {
      errorMessage.value = "Error fetching driver details: ${e.toString()}";
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
