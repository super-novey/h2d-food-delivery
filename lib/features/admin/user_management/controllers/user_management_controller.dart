import 'package:food_delivery_h2d/bindings/network_manager.dart';
import 'package:food_delivery_h2d/data/user/user_repository.dart';
import 'package:food_delivery_h2d/features/admin/dashboard/models/chart_model.dart';
import 'package:food_delivery_h2d/features/admin/user_management/models/user_model.dart';
import 'package:get/get.dart';

class UserManagementController extends GetxController {
  static UserManagementController get instance => Get.find();
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var touchedIndex = (-1).obs;
  final UserRepository _repository = UserRepository();
  var roleCounts = <String, int>{}.obs; // Chúng ta lưu trữ thông tin số lượng vai trò

  @override
  void onInit() {
    fetchAllUsers();
    super.onInit();
  }

  void fetchAllUsers() async {
    try {
      isLoading(true);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      final data = await _repository.fetchAllUsers();
      userList.value = data;

      updateRoleCounts();
    } catch (e) {
      errorMessage.value = e.toString();
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void updateRoleCounts() {
    final Map<String, int> counts = {};
    for (var user in userList) {
      final role = user.role;
      counts[role] = (counts[role] ?? 0) + 1;
    }
    roleCounts.value = counts; 
  }

  List<ChartModel> getPieChartData() {
    final totalUsers = roleCounts.values.fold(0, (sum, count) => sum + count);
    return roleCounts.entries
        .map((entry) => ChartModel(
              xData: entry.key,
              count: entry.value,
              yData: ((entry.value / totalUsers) * 100).toStringAsFixed(1),
            ))
        .toList();
  }

  void updateTouchedIndex(int index) {
    touchedIndex.value = index;
  }
}

