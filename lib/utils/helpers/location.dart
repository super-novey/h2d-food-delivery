import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/helpers/helper_functions.dart';
import 'package:food_delivery_h2d/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocationHelper {
  static const String locationIqApiKey = "pk.830e389b41abcec44116a981f89c54d4";
  static const String baseUrl = "https://us1.locationiq.com/v1";

  static Future<String?> getAddressFromCoordinates(
      double latitude, double longitude) async {
    final url = Uri.parse(
        "$baseUrl/reverse.php?key=$locationIqApiKey&lat=$latitude&lon=$longitude&format=json&accept-language=vi");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log("📍 Dữ liệu từ LocationIQ: ${jsonEncode(data)}");

        String? provinceName = data["address"]["state"];
        if (provinceName == null ||
            HelperFunctions.removeDiacritics(provinceName.toLowerCase()) !=
                HelperFunctions.removeDiacritics(
                    "Thành phố Hồ Chí Minh".toLowerCase())) {
          Loaders.errorSnackBar(
            title: "Cảnh báo",
            message: "Vị trí hiện tại không thuộc TP Hồ Chí Minh.",
          );
          return null;
        }

        String? districtName =
            data["address"]["county"] ?? data["address"]["city"];
        String? communeName = data["address"]["town"] ??
            data["address"]["village"] ??
            data["address"]["hamlet"] ??
            data["address"]["suburb"];
        String fullAddressString = data["display_name"] ?? "";

        List<String?> removeParts = [
          data["address"]["quarter"],
          data["address"]["suburb"],
          data["address"]["city"],
          data["address"]["postcode"],
          data["address"]["country"],
        ];

        String removeString =
            removeParts.where((element) => element != null).join(", ");

        if (removeString.isNotEmpty) {
          fullAddressString =
              fullAddressString.replaceAll(removeString, "").trim();
        }

        fullAddressString = fullAddressString.replaceAll(RegExp(r",\s*$"), "");

        List<String> addressParts = [];
        if (communeName != null) addressParts.add(communeName);
        if (districtName != null) addressParts.add(districtName);
        if (provinceName != null) addressParts.add(provinceName);

        String formattedAddress = addressParts.isNotEmpty
            ? addressParts.join(", ")
            : fullAddressString;

        print("🟢 Địa chỉ đầy đủ: $formattedAddress");
        return formattedAddress;
      } else {
        Get.snackbar("Lỗi", "Không thể lấy địa chỉ. Vui lòng thử lại.");
        return null;
      }
    } catch (e) {
      Loaders.errorSnackBar(title: "Lỗi", message: "Lỗi khi lấy địa chỉ: $e");
      return null;
    }
  }

  static Future<Map<String, double>?> getCoordinatesFromAddress(
      String address) async {
    final url = Uri.parse(
        "$baseUrl/search.php?key=$locationIqApiKey&q=${Uri.encodeComponent(address)}&format=json&accept-language=vi");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.isNotEmpty) {
          final result = data[0];
          String? provinceName = result["address"]?["state"];
          if (provinceName == null ||
              HelperFunctions.removeDiacritics(provinceName.toLowerCase()) !=
                  HelperFunctions.removeDiacritics(
                      "Thành phố Hồ Chí Minh".toLowerCase())) {
            Get.snackbar(
              "Cảnh báo",
              "Địa chỉ không thuộc TP Hồ Chí Minh.",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return null;
          }

          return {
            "latitude": double.parse(result["lat"]),
            "longitude": double.parse(result["lon"]),
          };
        }
      }
      Get.snackbar("Lỗi", "Không thể tìm thấy tọa độ cho địa chỉ này.");
      return null;
    } catch (e) {
      Loaders.errorSnackBar(title: "Lỗi", message: "Lỗi khi tìm tọa độ: $e");
      return null;
    }
  }
}
