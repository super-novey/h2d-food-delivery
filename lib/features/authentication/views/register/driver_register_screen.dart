import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/driver_register_controller.dart';
import 'package:food_delivery_h2d/features/authentication/controllers/driver_tab_controller.dart';
import 'package:food_delivery_h2d/features/authentication/models/ProvinceModel.dart';
import 'package:food_delivery_h2d/features/authentication/views/register/widgets/user_register_form.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';

class DriverRegisterScreen extends StatelessWidget {
  DriverRegisterScreen({super.key});

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
        body: Obx(
          () => (_driverRegisterController.isLoading.value)
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(controller: _tabController.controller, children: [
                  Padding(
                      padding: const EdgeInsets.all(MySizes.defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          UserRegisterForm(
                              emailController:
                                  _driverRegisterController.emailController,
                              nameController:
                                  _driverRegisterController.nameController,
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
                  Padding(
                    padding: const EdgeInsets.all(MySizes.defaultSpace),
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                            decoration: const InputDecoration(
                                labelText: "Tỉnh/Thành phố"),
                            value: _driverRegisterController
                                    .selectedProvinceId.value.isNotEmpty
                                ? _driverRegisterController
                                    .selectedProvinceId.value
                                : null,
                            items: _driverRegisterController.provinces
                                .map((province) {
                              return DropdownMenuItem<String>(
                                  value: province.id,
                                  child: Text(province.name));
                            }).toList(),
                            onChanged: (value) {
                              _driverRegisterController
                                  .updateSelectedProvinceId(value.toString());
                            }),
                        const SizedBox(
                          height: MySizes.spaceBtwInputFields,
                        ),
                        Obx(
                          () => DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  labelText: "Quận/Huyện"),
                              value: _driverRegisterController
                                      .selectedDistrictId.value.isNotEmpty
                                  ? _driverRegisterController
                                      .selectedDistrictId.value
                                  : null,
                              items: _driverRegisterController.districts
                                  .map((district) {
                                return DropdownMenuItem<String>(
                                    value: district.id,
                                    child: Text(district.name));
                              }).toList(),
                              onChanged: (value) {
                                _driverRegisterController
                                    .updateSelectedDistrictId(value.toString());
                              }),
                        ),
                        const SizedBox(
                          height: MySizes.spaceBtwInputFields,
                        ),
                        Obx(
                          () => DropdownButtonFormField(
                              decoration:
                                  const InputDecoration(labelText: "Phường/Xã"),
                              value: _driverRegisterController
                                      .selectedCommuneId.value.isNotEmpty
                                  ? _driverRegisterController
                                      .selectedCommuneId.value
                                  : null,
                              items: _driverRegisterController.communes
                                  .map((commune) {
                                return DropdownMenuItem<String>(
                                    value: commune.id,
                                    child: Text(commune.name));
                              }).toList(),
                              onChanged: (value) {
                                _driverRegisterController
                                    .updateSelectedCommuneId(value.toString());
                              }),
                        ),
                        const SizedBox(
                          height: MySizes.spaceBtwInputFields,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: _driverRegisterController
                                .detailAddressController,
                            decoration: InputDecoration(
                                labelText: "Địa chỉ",
                                suffixText:
                                    "${_driverRegisterController.lenghtDetailAddress}/255"),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(255),
                            ],
                            onChanged: (value) {
                              _driverRegisterController
                                  .handleDetailAddressChange(value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                  ),
                ]),
        ),
      ),
    );
  }
}
