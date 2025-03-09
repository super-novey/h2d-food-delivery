import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class MapWidgetController extends GetxController {
  final String apiKey =
      '5b3ce3597851110001cf6248624e1bd0362941f69f8006f0e3fec245';

  var shipperLocation = LatLng(10.7769, 106.7009).obs;
  var restaurantLocation = LatLng(10.7955, 106.6841).obs;
  var customerLocation = LatLng(10.8231, 106.6297).obs;

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

  /// Gọi OpenRouteService API để tìm tuyến đường từ Shipper -> Quán ăn -> Khách hàng
  Future<void> fetchRoute() async {
    final String url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey'
        '&start=${shipperLocation.value.longitude},${shipperLocation.value.latitude}'
        '&end=${customerLocation.value.longitude},${customerLocation.value.latitude}'
        '&via=${restaurantLocation.value.longitude},${restaurantLocation.value.latitude}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['features'] != null && data['features'].isNotEmpty) {
          final route = data['features'][0];
          final geometry = route['geometry'];

          if (geometry != null && geometry['coordinates'] != null) {
            final List<dynamic> coordinates = geometry['coordinates'];

            // Chuyển đổi tọa độ từ [lng, lat] sang LatLng
            routePoints.assignAll(
              coordinates.map((coord) => LatLng(coord[1], coord[0])).toList(),
            );
          } else {
            print('Lỗi: Không tìm thấy geometry trong response');
          }
        } else {
          print('Lỗi: Không tìm thấy tuyến đường');
        }
      } else {
        print('Lỗi API: ${response.body}');
      }
    } catch (e) {
      print('Lỗi kết nối API: $e');
    }
  }

  /// Lấy tọa độ từ địa chỉ bằng OpenRouteService API
  Future<LatLng?> getCoordinatesFromAddress(String address) async {
    final String url =
        'https://api.openrouteservice.org/geocode/search?api_key=$apiKey&text=$address';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['features'] != null && data['features'].isNotEmpty) {
          final coordinates = data['features'][0]['geometry']['coordinates'];
          print(LatLng(coordinates[1], coordinates[0]));
          return LatLng(
              coordinates[1], coordinates[0]); // [lng, lat] -> [lat, lng]
        } else {
          print('Không tìm thấy tọa độ cho địa chỉ: $address');
        }
      } else {
        print('Lỗi API: ${response.body}');
      }
    } catch (e) {
      print('Lỗi kết nối API: $e');
    }
    return null;
  }
}
