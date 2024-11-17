import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/authentication/auth_repository.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // TextEdit Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumbController = TextEditingController();
  final passwordController = TextEditingController();

  late UserModel registeredUser;

  Future<void> register() async {
    final newUser = getUserFromForm();
    try {
      registeredUser = await AuthRepository.instance.register(newUser);
      registeredUser.printInfo();
      Loaders.successSnackBar(title: "Đăng ký thành công!");
    } catch (error) {
      print("ERRO ${error.toString()}");
    } finally {}
  }

  UserModel getUserFromForm() {
    return UserModel(
        id: "",
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        status: false,
        role: UserRole.customer.name,
        phone: phoneNumbController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }
}
