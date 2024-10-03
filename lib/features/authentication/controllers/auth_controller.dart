import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var isShowPassword = false.obs;

  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }
}
