import 'dart:async';
import 'dart:developer';
import 'package:food_delivery_h2d/services/location_service.dart';
import 'package:food_delivery_h2d/services/permission_service.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWidgetController extends GetxController {
  var currentPosition =
      const LatLng(10.8231, 106.6297).obs; // Default to HCM City, Vietnam

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      final current = await LocationService.getLocation();
      if (current == null) return;
      currentPosition.value = LatLng(current.latitude, current.longitude);
    } catch (e) {
      log('Error occurred while getting location: $e');
    }
  }
}
