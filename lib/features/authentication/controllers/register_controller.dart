import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/authentication/auth_repository.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  //final AuthRepository _authRepository = Get.put(AuthRepository());

  // TextEdit Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumbController = TextEditingController();
  final passwordController = TextEditingController();
  final roleController = "customer".obs;

  late UserModel registeredUser;

  void register() async {
    final newUser = getUserFromForm();
    try {
      registeredUser = await AuthRepository.instance.register(newUser);
    } catch (error) {
      print("ERRO ${error.toString()}");
    } finally {}
  }

  // void sendOTP(String email) async {
  //   AuthRepository.instance.sendOTP(email);
  // }

  UserModel getUserFromForm() {
    return UserModel(
        id: "",
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        status: false,
        role: roleController.value,
        phone: phoneNumbController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }
}
