import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_h2d/common/widgets/keyboard/keyboard_hider.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/register_controller.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/login_screen.dart';
import 'package:food_delivery_h2d/features/authentication/views/login/widgets/login_header.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/OTP_verification_screen.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CustomerRegisterScreen extends StatelessWidget {
  CustomerRegisterScreen({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: KeyboardHider(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: MySizes.iconMd,
                      ),
                    ),

                    const SizedBox(
                      height: MySizes.spaceBtwItems,
                    ),
                    Text("Đăng ký",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .apply(color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(MySizes.defaultSpace),
                child: Column(children: [
                  // register form
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                            labelText: "Email", hintText: "Email"),
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.nameController,
                        decoration: const InputDecoration(
                            labelText: "Họ và tên", hintText: "Nhập họ và tên"),
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.phoneNumbController,
                        decoration: const InputDecoration(
                            labelText: "Số điện thoại",
                            hintText: "Nhập số điện thoại"),
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                            labelText: "Mật khẩu", hintText: "Nhập mật khẩu"),
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwInputFields,
                      ),
                      DropdownButtonFormField(
                          decoration:
                              const InputDecoration(labelText: "Vai trò"),
                          value: controller.roleController.value,
                          items: const [
                            DropdownMenuItem(
                                value: "customer", child: Text("Khách hàng")),
                            DropdownMenuItem(
                                value: "partner", child: Text("Đối tác")),
                            DropdownMenuItem(
                                value: "driver", child: Text("Tài xế")),
                          ],
                          onChanged: (value) {
                            controller.roleController.value = value.toString();
                          })
                    ],
                  )),
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        controller.register();
                        // Get.to(() => OtpVerificationScreen(
                        //       emailAddress: "nganhduy2101003@gmail.com",
                        //     ));
                      },
                      child: const Text("Đăng ký"),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
