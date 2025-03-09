import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_delivery_h2d/common/widgets/appbar/custom_app_bar.dart';
import 'package:food_delivery_h2d/features/customers/follow_order/controllers/map_controller.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';

class MapWidget extends StatelessWidget {
  MapWidget({super.key});

  final mapController = Get.put(MapWidgetController());
  final flutterMapController = MapController();

  void _showPointSelectionDialog(BuildContext context, LatLng point) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Chọn loại điểm"),
          content: const Text("Bạn muốn đặt điểm này làm gì?"),
          actions: [
            TextButton(
              onPressed: () {
                mapController.updatePoint(point, 'shipper');
                Navigator.pop(ctx);
              },
              child: const Text("Shipper"),
            ),
            TextButton(
              onPressed: () {
                mapController.updatePoint(point, 'restaurant');
                Navigator.pop(ctx);
              },
              child: const Text("Quán ăn"),
            ),
            TextButton(
              onPressed: () {
                mapController.updatePoint(point, 'customer');
                Navigator.pop(ctx);
              },
              child: const Text("Khách hàng"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Theo dõi đơn hàng"),
      ),
      body: Stack(
        children: [
          Obx(() => FlutterMap(
                mapController: flutterMapController,
                options: MapOptions(
                  initialCenter: mapController.customerLocation.value,
                  initialZoom: 15.0,
                  minZoom: 5.0,
                  maxZoom: 20.0,
                  onTap: (tapPosition, point) {
                    _showPointSelectionDialog(context, point);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: mapController.routePoints.toList(),
                        strokeWidth: 5.0,
                        color: MyColors.primaryColor,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: mapController.shipperLocation.value,
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset('assets/icons/ic-shipper-marker.png',
                            width: 100, height: 100),
                      ),
                      Marker(
                        point: mapController.customerLocation.value,
                        width: 40.0,
                        height: 40.0,
                        child: Image.asset('assets/icons/ic-home-marker.png',
                            width: 40, height: 40),
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () async {
                await mapController.fetchRoute();
                if (mapController.routePoints.isNotEmpty) {
                  flutterMapController.move(
                      mapController.routePoints.first, 13.0);
                }
              },
              child: const Text("Tìm đường đi"),
            ),
          ),
        ],
      ),
    );
  }
}
