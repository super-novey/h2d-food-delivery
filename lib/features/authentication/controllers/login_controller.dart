import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/bindings/network_manager.dart';
import 'package:food_delivery_h2d/data/authentication/auth_repository.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/login_screen.dart';
import 'package:food_delivery_h2d/features/customers/customer_navigation_menu.dart';
import 'package:food_delivery_h2d/features/restaurants/restaurant_navigation_menu.dart';
import 'package:food_delivery_h2d/features/shippers/shipper_navigation_menu.dart';
import 'package:food_delivery_h2d/routes/routes.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var isShowPassword = false.obs;
  var isLoading = false.obs;

  // TextEdit Controllers
  final _localStorage = GetStorage();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  // final selectedRole = UserRole.customer.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Repository
  final AuthRepository _authRepository = Get.put(AuthRepository());

  void saveUser(UserModel user) {
    _localStorage.write("currentUser", user);
  }

  UserModel? get currentUser {
    return _localStorage.read<UserModel>("currentUser");
  }

  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }

  void login() async {
    final userName = userNameController.text;
    final password = passwordController.text;

    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      final res = await _authRepository.login(userName.trim(), password.trim());
      saveUser(res.user);

      if (res.user.role == "driver") {
        Loaders.successSnackBar(
            title: "Thành công!", message: "Đăng nhập thành công");
        Get.offAll(() => const ShipperNavigationMenu());
      } else if (res.user.role == "partner") {
        Loaders.successSnackBar(
            title: "Thành công!", message: "Đăng nhập thành công");
        Get.offAll(() => const RestaurantNavigationMenu());
      } else if (res.user.role == "customer") {
        Loaders.successSnackBar(
            title: "Thành công!", message: "Đăng nhập thành công");
        Get.offAll(() => const CustomerNavigationMenu());
      } else {
        Loaders.successSnackBar(
            title: "Thành công!", message: "Đăng nhập thành công");

        if (kIsWeb) {
          Get.toNamed(Routes.dashboard);
        } else {
          Loaders.customToast(message: 'Chỉ đăng nhập bằng website!');
        }
      }
    } catch (err) {
      Loaders.errorSnackBar(
          title: "Thất bại!", message: "Sai Tên đăng nhập hoặc mật khẩu");
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    _localStorage.remove("currentUser");

    Get.offAll(() => const LoginScreen());
  }
}
