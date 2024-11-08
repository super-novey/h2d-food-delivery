import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/models/profile_restaurant_model.dart';

class ProfileRestaurantController extends GetxController {
  static ProfileRestaurantController get instance => Get.find();

  // Thêm thuộc tính profile
  var profile = ProfileRestaurant(); // Khởi tạo ProfileRestaurant theo nhu cầu

  void toggleItemAvailability(ProfileRestaurant profile) {
    profile.isAvailable.value = !profile.isAvailable.value; // Chuyển đổi trạng thái
  }
}
