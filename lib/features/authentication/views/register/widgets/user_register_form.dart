import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';

class UserRegisterForm extends StatelessWidget {
  const UserRegisterForm({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.phoneNumbController,
    required this.passwordController,
  });

  // final CustomerRegisterController controller;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneNumbController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration:
              const InputDecoration(labelText: "Email", hintText: "Email"),
        ),
        const SizedBox(
          height: MySizes.spaceBtwInputFields,
        ),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
              labelText: "Họ và tên", hintText: "Nhập họ và tên"),
        ),
        const SizedBox(
          height: MySizes.spaceBtwInputFields,
        ),
        TextFormField(
          controller: phoneNumbController,
          decoration: const InputDecoration(
              labelText: "Số điện thoại", hintText: "Nhập số điện thoại"),
        ),
        const SizedBox(
          height: MySizes.spaceBtwInputFields,
        ),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
              labelText: "Mật khẩu", hintText: "Nhập mật khẩu"),
        ),
      ],
    ));
  }
}