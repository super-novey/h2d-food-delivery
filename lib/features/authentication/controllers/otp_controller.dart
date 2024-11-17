import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/authentication/auth_repository.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/login_screen.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OtpController {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  String returnOTP() {
    return controllers.map((controller) => controller.text).join('');
  }

  void verifyOTP(String email) async {
    try {
      final message =
          await AuthRepository.instance.verifyOTP(email, returnOTP());
      Loaders.successSnackBar(title: message);

      Get.offAll(() => const LoginScreen());
    } catch (_) {
      Loaders.errorSnackBar(title: "Mã OTP không tồn tại!");
    }
  }

  Future resendOTP(String email) async {
    try {
      final message = await AuthRepository.instance.resendOTP(email);
      Loaders.successSnackBar(title: message);
    } catch (_) {
      Loaders.errorSnackBar(title: "Email không hợp lệ!");
    }
  }
}
