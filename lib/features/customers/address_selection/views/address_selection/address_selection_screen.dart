import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/address_selection/controllers/address_selection_controller.dart';
import 'package:food_delivery_h2d/features/customers/confirm_order/controllers/order_controller.dart';
import 'package:food_delivery_h2d/features/customers/follow_order/controllers/follow_order_controller.dart';
import 'package:food_delivery_h2d/utils/constants/sizes.dart';
import 'package:geolocator/geolocator.dart'; // Import Geolocator
import 'package:get/get.dart';

class AddressSelectionScreen extends StatelessWidget {
  AddressSelectionScreen({super.key, required this.isUpdate, this.orderId});
  final bool isUpdate;
  final String? orderId;

  final AddressSelectionController _addressController =
      Get.put(AddressSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Địa chỉ giao hàng"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: "Tỉnh/Thành phố"),
                  value: _addressController.selectedProvinceId.value.isNotEmpty
                      ? _addressController.selectedProvinceId.value
                      : null,
                  items: _addressController.provinces.map((province) {
                    return DropdownMenuItem<String>(
                        value: province.id, child: Text(province.fullName));
                  }).toList(),
                  onChanged: (value) {
                    _addressController
                        .updateSelectedProvinceId(value.toString());
                  },
                ),
              ),
              const SizedBox(height: MySizes.spaceBtwInputFields),

              // Dropdown Quận/Huyện
              Obx(
                () => DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: "Quận/Huyện"),
                  value: _addressController.selectedDistrictId.value.isNotEmpty
                      ? _addressController.selectedDistrictId.value
                      : null,
                  items: _addressController.districts.map((district) {
                    return DropdownMenuItem<String>(
                        value: district.id, child: Text(district.fullName));
                  }).toList(),
                  onChanged: (value) {
                    _addressController
                        .updateSelectedDistrictId(value.toString());
                  },
                ),
              ),
              const SizedBox(height: MySizes.spaceBtwInputFields),

              // Dropdown Phường/Xã
              Obx(
                () => DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: "Phường/Xã"),
                  value: _addressController.selectedCommuneId.value.isNotEmpty
                      ? _addressController.selectedCommuneId.value
                      : null,
                  items: _addressController.communes.map((commune) {
                    return DropdownMenuItem<String>(
                        value: commune.id, child: Text(commune.fullName));
                  }).toList(),
                  onChanged: (value) {
                    _addressController
                        .updateSelectedCommuneId(value.toString());
                  },
                ),
              ),
              const SizedBox(height: MySizes.spaceBtwInputFields),

              // Ô nhập địa chỉ chi tiết
              Obx(
                () => TextFormField(
                  controller: _addressController.detailAddressController,
                  decoration: InputDecoration(
                    labelText: "Địa chỉ",
                    suffix: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0), // Thêm khoảng cách bên trái
                      child:
                          Text("${_addressController.lenghtDetailAddress}/255"),
                    ),
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(255),
                  ],
                  onChanged: (value) {
                    _addressController.handleDetailAddressChange(value);
                  },
                ),
              ),

              const SizedBox(height: MySizes.spaceBtwInputFields),

              // Nút chọn vị trí hiện tại
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: _addressController.fetchCurrentLocation,
                  icon: const Icon(Icons.my_location),
                  label: const Text("Sử dụng vị trí hiện tại"),
                ),
              ),

              // Nút Xác nhận
              ElevatedButton(
                onPressed: () {
                  String newAddress =
                      AddressSelectionController.instance.fullAddress.value;
                  if (isUpdate) {
                    var controller = Get.put(FollowOrderController());
                    controller.updateCustAddress(orderId!, newAddress);
                    Get.back(result: newAddress);
                  } else {
                    OrderController.instance.order.custAddress = newAddress;
                    Get.back();
                  }
                },
                child: const Text("Xác nhận"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
