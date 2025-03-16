import 'package:food_delivery_h2d/data/map/map_repository.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapWidgetController extends GetxController {
  final MapRepository _mapRepository = Get.put(MapRepository());

  var shipperLocation = const LatLng(10.7769, 106.7009).obs;
  var restaurantLocation = const LatLng(10.7955, 106.6841).obs;
  var customerLocation = const LatLng(10.8231, 106.6297).obs;

  var routePoints = <LatLng>[].obs;

  void updatePoint(LatLng point, String type) {
    if (type == 'shipper') {
      shipperLocation.value = point;
    } else if (type == 'restaurant') {
      restaurantLocation.value = point;
    } else if (type == 'customer') {
      customerLocation.value = point;
    }
    fetchRoute();
  }

  Future<void> fetchRoute() async {
    try {
      List<LatLng> points = await _mapRepository.fetchRoute(
          shipperLocation.value,
          restaurantLocation.value,
          customerLocation.value);
      routePoints.assignAll(points);
    } catch (e) {
      print("Error fetching route: $e");
    }
  }

  Future<void> getCoordinatesFromAddress(String address, String type) async {
    try {
      LatLng? location =
          await _mapRepository.getCoordinatesFromAddress(address);
      updatePoint(location!, type);
    } catch (e) {
      print("Error getting coordinates: $e");
    }
  }
}
