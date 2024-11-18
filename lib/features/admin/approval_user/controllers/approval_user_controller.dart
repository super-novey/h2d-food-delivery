import 'package:food_delivery_h2d/bindings/network_manager.dart';
import 'package:food_delivery_h2d/data/user/user_repository.dart';
import 'package:food_delivery_h2d/features/admin/user_management/models/user_model.dart';
import 'package:get/get.dart';

class ApprovalUserController extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final UserRepository _repository = UserRepository();

  @override
  void onInit() {
    super.onInit();
    fetchUserByRole(); 
  }

  void fetchUserByRole({String? role}) async {
    try {
      isLoading(true);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      
      final data = await _repository.fetchUserByRole(role: role); 
      userList.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
