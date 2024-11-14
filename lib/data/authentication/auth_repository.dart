import 'package:food_delivery_h2d/features/authentication/models/LoginResponse.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final data = {'email': email, 'password': password};
    try {
      final res = await HttpHelper.post("auth/login", data);
      return res;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<LoginResponse> login1(String email, String password) async {
    final data = {'email': email, 'password': password};
    try {
      final res = await HttpHelper.post("auth/login", data);
      final loginResponse = LoginResponse.fromJson(res["data"]);
      return loginResponse;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
