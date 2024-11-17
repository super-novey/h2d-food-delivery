import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/driver_register_controller.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/driver_tab_controller.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/widgets/user_register_form.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';

class DriverRegisterScreen extends StatefulWidget {
  DriverRegisterScreen({super.key});

  @override
  State<DriverRegisterScreen> createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen>
    with SingleTickerProviderStateMixin {
  final DriverRegisterController _driverRegisterController =
      Get.put(DriverRegisterController());

  final DriverTabController _tabController = Get.put(DriverTabController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: MyColors.primaryTextColor,
                size: MySizes.iconMd,
              )),
          title: Text(
            "Đăng ký tài xế",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          bottom: MyTabbar(
              controller: _tabController.controller,
              tabs: _tabController.myTabs),
        ),
        body: TabBarView(controller: _tabController.controller, children: [
          Padding(
              padding: const EdgeInsets.all(MySizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  UserRegisterForm(
                      emailController:
                          _driverRegisterController.emailController,
                      nameController: _driverRegisterController.nameController,
                      phoneNumbController:
                          _driverRegisterController.phoneNumbController,
                      passwordController:
                          _driverRegisterController.passwordController),
                  const SizedBox(
                    height: MySizes.spaceBtwInputFields,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _tabController.next();
                      },
                      child: const Text("Tiếp tục"))
                ],
              )),
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.red,
          ),
        ]),
      ),
    );
  }
}
