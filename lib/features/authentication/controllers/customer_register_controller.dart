import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/authentication/auth_repository.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/constants/image_paths.dart';
import 'package:food_delivery_h2d/utils/popups/full_screen_loader.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CustomerRegisterController extends GetxController {
  static CustomerRegisterController get instance => Get.find();

  // TextEdit Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumbController = TextEditingController();
  final passwordController = TextEditingController();

  late UserModel registeredUser;

  Future<void> register() async {
    final newUser = getUserFromForm();
    try {
      FullScreenLoader.openDialog("Đang xử lý", MyImagePaths.spoonAnimation);
      registeredUser = await AuthRepository.instance.register(newUser);
      registeredUser.printInfo();
      Loaders.successSnackBar(title: "Đăng ký thành công!");
    } catch (error) {
      print("ERRO ${error.toString()}");
    } finally {
      FullScreenLoader.stopLoading();
    }
  }

  UserModel getUserFromForm() {
    return UserModel(
        userId: "",
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
