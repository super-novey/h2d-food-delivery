import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/auth_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(LoginController());
    return Form(
        child: Column(
      children: [
        TextFormField(
          obscureText: false,
          decoration: const InputDecoration(
            hintText: "Tên đăng nhập",
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        const SizedBox(
          height: MySizes.spaceBtwInputFields,
        ),
        Obx(
          () => TextFormField(
            obscureText: !authController.isShowPassword.value,
            decoration: InputDecoration(
                hintText: "Mật khẩu",
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                suffix: GestureDetector(
                    onTap: () => authController.togglePasswordVisibility(),
                    child: Icon(
                      (authController.isShowPassword.value)
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ))),
          ),
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child:
              TextButton(onPressed: () {}, child: const Text("Quên mật khẩu")),
        ),
        const SizedBox(
          height: MySizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Đăng nhập"),
          ),
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            child: const Text("Đăng ký"),
          ),
        )
      ],
    ));
  }
}
