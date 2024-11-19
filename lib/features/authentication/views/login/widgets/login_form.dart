import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/customer_register_screen.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/register_navigation_menu.dart';
import 'package:food_delivery_h2d/features/restaurants/restaurant_navigation_menu.dart';
import 'package:food_delivery_h2d/features/shippers/shipper_navigation_menu.dart';
import 'package:food_delivery_h2d/features/admin/dashboard/admin_dashboard.dart';
import 'package:food_delivery_h2d/features/customers/customer_navigation_menu.dart';
import 'package:food_delivery_h2d/routes/routes.dart';
import 'package:food_delivery_h2d/utils/constants/enums.dart';
import 'package:food_delivery_h2d/utils/helpers/convert_role.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:food_delivery_h2d/utils/validations/validators.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(LoginController());
    return Form(
        key: authController.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: authController.userNameController,
              validator: (value) => Validators.validateEmail(value),
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
                controller: authController.passwordController,
                obscureText: !authController.isShowPassword.value,
                validator: (value) =>
                    Validators.validateEmptyText("Mật khẩu", value),
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
            // Column(
            //   children: UserRole.values.map((role) {
            //     return Obx(() => RadioListTile<UserRole>(
            //           title: Text(ConvertEnumRole.toDisplayName(role)),
            //           value: role,
            //           groupValue: authController.selectedRole.value,
            //           onChanged: (value) {
            //             if (value != null) {
            //               authController.selectedRole.value = value;
            //             }
            //           },
            //         ));
            //   }).toList(),
            // ),
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("Quên mật khẩu")),
            ),
            const SizedBox(
              height: MySizes.spaceBtwSections,
            ),

            Obx(
              () => authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: authController.login,
                        child: const Text("Đăng nhập"),
                      ),
                    ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const RegisterNavigationMenu());
                },
                child: const Text("Đăng ký"),
              ),
            )
          ],
        ));
  }
}
