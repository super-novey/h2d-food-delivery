import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/authentication/auth_repository.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:food_delivery_h2d/features/customers/customer_navigation_menu.dart';
import 'package:food_delivery_h2d/features/restaurants/restaurant_navigation_menu.dart';
import 'package:food_delivery_h2d/features/shippers/shipper_navigation_menu.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var isShowPassword = false.obs;
  var isLoading = false.obs;

  // TextEdit Controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  // Repository
  final AuthRepository _authRepository = Get.put(AuthRepository());

  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }

  void login() async {
    final userName = userNameController.text;
    final password = passwordController.text;

    try {
      isLoading.value = true;
      // final res = await _authRepository.login(userName, password);
      // final user = User.fromJson(res["data"]["user"]);
      final res = await _authRepository.login(userName, password);
      // res.user.printInfo();
      if (res.user.role == "driver") {
        Get.offAll(() => const ShipperNavigationMenu());
      } else if (res.user.role == "partner") {
        Get.offAll(() => const RestaurantNavigationMenu());
      } else if (res.user.role == "customer") {
        Get.offAll(() => const CustomerNavigationMenu());
      } else {
        print("Admin");
      }
      Loaders.successSnackBar(
          title: "Thành công!", message: "Đăng nhập thành công");
    } catch (err) {
      Loaders.errorSnackBar(
          title: "Thất bại!", message: "Sai Tên đăng nhập hoặc mật khẩu");
    } finally {
      isLoading.value = false;
    }
  }
}
