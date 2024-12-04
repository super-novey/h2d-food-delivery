import 'package:food_delivery_h2d/data/address/address_repository.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/login_controller.dart';
import 'package:food_delivery_h2d/features/authentication/models/CommuneModel.dart';
import 'package:food_delivery_h2d/features/authentication/models/DistrictModel.dart';
import 'package:food_delivery_h2d/features/authentication/models/ProvinceModel.dart';
import 'package:get/get.dart';
import 'package:food_delivery_h2d/features/restaurants/profile/models/profile_restaurant_model.dart';

class ProfileCustomerController extends GetxController {
  static ProfileCustomerController get instance => Get.find();

  var isLoading = false.obs;


 
}
