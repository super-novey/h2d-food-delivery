import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverRegisterController extends GetxController {
  static DriverRegisterController get instance => Get.find();

  // TextEdit Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumbController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumbController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
