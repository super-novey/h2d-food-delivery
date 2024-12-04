import 'package:food_delivery_h2d/features/authentication/models/DriverModel.dart';
import 'package:food_delivery_h2d/features/restaurants/rating_management/models/rating_restaurant_model.dart';
import 'package:food_delivery_h2d/features/shippers/income/models/income_model.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class DriverRepository extends GetxController {
  static DriverRepository get instance => Get.find();

  static const String _driverApi = "driver";

  Future<DriverModel> getCurrentDriver(String userId) async {
    try {
      final res = await HttpHelper.get("$_driverApi/${userId.toString()}");
      return DriverModel.fromJson(res["data"]);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> updateDriverStatus(String userId, bool status) async {
    try {
      final data = {
        'status': status,
      };
      print('REPO STATUS: $data');

      final res = await HttpHelper.put("driver/updateStatus/$userId", data);

      print("Response from API: $res");

      if (res["hasError"] == false && res["statusCode"] == 200) {
        print("Driver status updated successfully.");
      } else {
        throw Exception("Failed to update driver status: ${res["message"]}");
      }
    } catch (error) {
      print("Error in updateDriverStatus: $error");
      rethrow;
    }
  }

  Future<List<RatingModel>> fetchDriverRating(String driverId) async {
    try {
      final response = await HttpHelper.get("driver/rating/$driverId");

      List<dynamic> data = response['data'] as List<dynamic>;
      print("rating partner $data");
      return data.map((item) => RatingModel.fromJson(item)).toList();
    } on Exception catch (e) {
      print("error $e");
      rethrow;
    }
  }

  Future<IncomeModel> fetchIncomeDriver(String driverId) async {
    try {
      final response = await HttpHelper.get("driver/statistic/$driverId");

      var data = response['data'];
      print("Driver income data: $data");

      return IncomeModel.fromJson(data);
    } on Exception catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
