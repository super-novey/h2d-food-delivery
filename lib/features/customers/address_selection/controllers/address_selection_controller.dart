import 'dart:convert';
import 'dart:developer';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/data/address/address_repository.dart';
import 'package:food_delivery_h2d/services/location_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressSelectionController extends GetxController {
  static AddressSelectionController get instance => Get.find();

  // OpenRouteService API Key
  final String _orsApiKey =
      "5b3ce3597851110001cf6248624e1bd0362941f69f8006f0e3fec245";
  final String _baseUrl = "https://api.openrouteservice.org";

  var provinces = [].obs;
  var districts = [].obs;
  var communes = [].obs;

  var selectedProvinceId = '79'.obs;
  var selectedDistrictId = ''.obs;
  var selectedCommuneId = ''.obs;
  var fullAddress = ''.obs;

  TextEditingController detailAddressController = TextEditingController();
  var lenghtDetailAddress = 0.obs;

  final AddressRepository _addressRepository = AddressRepository();

  @override
  void onInit() {
    super.onInit();
    fetchDistricts('79');
  }

  // Fetch provinces from AddressRepository
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

  // Update selected province ID and clear district and commune selections
  void updateSelectedProvinceId(String provinceId) {
    selectedProvinceId.value = provinceId;
    selectedDistrictId.value = '';
    selectedCommuneId.value = '';
    fetchDistricts(provinceId); // Fetch districts based on selected province
    updateFullAddress(); // Update the full address after province selection
  }

  void updateSelectedDistrictId(String districtId) {
    selectedDistrictId.value = districtId;
    selectedCommuneId.value = '';
    fetchCommunes(districtId);
    updateFullAddress();
  }

  void updateSelectedCommuneId(String communeId) {
    selectedCommuneId.value = communeId;
    updateFullAddress();
  }

  void handleDetailAddressChange(String value) {
    lenghtDetailAddress.value = value.length;
    updateFullAddress();
  }

  @override
  void onClose() {
    detailAddressController.dispose();
    super.onClose();
  }

  String? getProvinceIdByName(String provinceName) {
    return provinces
        .firstWhereOrNull((province) => province.fullName
            .toLowerCase()
            .contains(provinceName.toLowerCase()))
        ?.id;
  }

  void updateFullAddress() {
    if (selectedDistrictId.value.isEmpty || selectedCommuneId.value.isEmpty) {
      fullAddress.value = '';
      return;
    }

    String provinceName = provinces
            .firstWhereOrNull(
                (province) => province.id == selectedProvinceId.value)
            ?.fullName ??
        '';

    String districtName = districts
            .firstWhereOrNull(
                (district) => district.id == selectedDistrictId.value)
            ?.fullName ??
        '';

    String communeName = communes
            .firstWhereOrNull(
                (commune) => commune.id == selectedCommuneId.value)
            ?.fullName ??
        '';

    fullAddress.value =
        '${detailAddressController.text}, $communeName, $districtName, $provinceName';
  }

  Map<String, dynamic>? getBestFeature(List<dynamic> features) {
    if (features.isEmpty) return null;

    features.sort((a, b) => (b['properties']['confidence'] as num)
        .compareTo(a['properties']['confidence'] as num));

    return features.first;
  }

  Future<void> updateLocation(double latitude, double longitude) async {
    const String locationIqApiKey = "pk.830e389b41abcec44116a981f89c54d4";
    final String url =
        "https://us1.locationiq.com/v1/reverse.php?key=$locationIqApiKey"
        "&lat=$latitude&lon=$longitude&format=json&accept-language=vi";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log("📍 Dữ liệu từ LocationIQ: ${jsonEncode(data)}");

        String? provinceName = data["address"]["state"]; // Tỉnh/Thành phố
        if (provinceName == null ||
            removeDiacritics(provinceName.toLowerCase()) !=
                removeDiacritics("Thành phố Hồ Chí Minh".toLowerCase())) {
          Get.snackbar(
              "Cảnh báo", "Vị trí hiện tại không thuộc TP Hồ Chí Minh.",
              backgroundColor: Colors.red, colorText: Colors.white);
          return;
        }
        String? districtName =
            data["address"]["county"] ?? data["address"]["city"]; // Quận/Huyện
        String? communeName = data["address"]["town"] ??
            data["address"]["village"] ??
            data["address"]["hamlet"] ??
            data["address"]["suburb"]; // Phường/Xã

        String fullAddressString = data["display_name"] ?? "";

        // 🔹 Xây dựng chuỗi cần loại bỏ
        String removeString = "";
        List<String> removeParts = [
          data["address"]["quarter"], // Phường
          data["address"]["suburb"], // Quận
          data["address"]["city"], // Thành phố
          data["address"]["postcode"], // Mã bưu điện
          data["address"]["country"], // Quốc gia
        ];

        // ✅ Tạo chuỗi cần xóa từ các phần tử không null
        removeString =
            removeParts.where((element) => element != null).join(", ");

        if (removeString.isNotEmpty) {
          fullAddressString =
              fullAddressString.replaceAll(removeString, "").trim();
        }

        fullAddressString = fullAddressString.replaceAll(RegExp(r",\s*$"), "");

        detailAddressController.text = fullAddressString;
        lenghtDetailAddress.value = fullAddressString.length;

        print("🟢 Địa chỉ đầy đủ: $fullAddressString");
        print("📍 Tỉnh/Thành phố: $provinceName");
        print("📍 Quận/Huyện: $districtName");
        print("📍 Phường/Xã: $communeName");

        if (provinces.isEmpty) {
          await fetchProvinces();
        }

        String? districtId = districts
            .firstWhereOrNull(
              (district) => removeDiacritics(district.fullName)
                  .toLowerCase()
                  .contains(removeDiacritics(districtName ?? "").toLowerCase()),
            )
            ?.id;

        if (districtId != null) {
          await fetchCommunes(districtId);
          updateSelectedDistrictId(districtId);
        } else {
          print("❌ Không tìm thấy ID quận/huyện: $districtName");
        }

        String? communeId = communes
            .firstWhereOrNull(
              (commune) => removeDiacritics(commune.fullName)
                  .toLowerCase()
                  .contains(removeDiacritics(communeName ?? "").toLowerCase()),
            )
            ?.id;

        if (communeId != null) {
          updateSelectedCommuneId(communeId);
        } else {
          print("❌ Không tìm thấy ID phường/xã: $communeName");
        }

        updateFullAddress();
      } else {
        Get.snackbar("Lỗi", "Không thể lấy địa chỉ. Vui lòng thử lại.");
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Lỗi khi lấy địa chỉ: $e");
    }
  }

  Future<void> fetchCurrentLocation() async {
    try {
      var position = await LocationService.getLocation();
      if (position == null) {
        Get.snackbar("Đã xảy ra lỗi", "Không thể lấy vị trí hiện tại.");
        return;
      }
      await updateLocation(position.latitude, position.longitude);
      // await updateLocation(10.7674, 106.7071);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể lấy vị trí hiện tại.");
    }
  }
}
