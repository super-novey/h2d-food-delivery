import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/address/address_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DriverRegisterController extends GetxController {
  static DriverRegisterController get instance => Get.find();

  // Repository
  final _addressRepository = Get.put(AddressRepository());

  // TextEdit Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumbController = TextEditingController();
  final passwordController = TextEditingController();
  final detailAddressController = TextEditingController();
  final licensePlateController = TextEditingController();

  // Address
  var provinces = [].obs;
  var districts = [].obs;
  var communes = [].obs;

  var selectedProvinceId = "".obs;
  var selectedDistrictId = "".obs;
  var selectedCommuneId = "".obs;

  var lenghtDetailAddress = RxInt(0);

  // Images
  var licenseFrontPlateImage = Rx<File?>(null);
  var licenseBackPlateImage = Rx<File?>(null);

  //Loading
  final isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    try {
      isLoading.value = true;
      await fetchProvinces();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumbController.dispose();
    passwordController.dispose();
    detailAddressController.dispose();
    provinces.clear();
    districts.clear();
    communes.clear();
    super.onClose();
  }

  void updateSelectedProvinceId(String value) {
    selectedProvinceId.value = value;
    fetchDistricts(value);
    selectedDistrictId.value = "";
    selectedCommuneId.value = "";
  }

  void updateSelectedDistrictId(String value) {
    selectedDistrictId.value = value;
    fetchCommunes(value);
    selectedCommuneId.value = "";
  }

  void updateSelectedCommuneId(String value) {
    selectedCommuneId.value = value;
  }

  void handleDetailAddressChange(String value) {
    lenghtDetailAddress.value = value.length;
  }

  Future<void> fetchProvinces() async {
    try {
      provinces.assignAll(await _addressRepository.getProvinces());
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchDistricts(String idProvince) async {
    try {
      districts.assignAll(await _addressRepository.getDistrict(idProvince));
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchCommunes(String idDistrict) async {
    try {
      communes.assignAll(await _addressRepository.getCommunes(idDistrict));
    } catch (e) {
      print(e);
    }
  }

  Future pickImage(Rx<File?> imageFile) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile.value = File(pickedImage.path);
      print(imageFile.value);
    } else {
      print("No image");
    }
  }
}
