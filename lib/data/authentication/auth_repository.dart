import 'package:food_delivery_h2d/features/authentication/models/LoginResponse.dart';
import 'package:food_delivery_h2d/features/authentication/models/User.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  static const String _loginApi = "auth/login";
  static const String _registerApi = "auth/register";
  static const String _verifyOTPApi = "auth/verifyOTP";
  static const String _resendOTPApi = "auth/resendOTP";

  // Future<Map<String, dynamic>> login(String email, String password) async {
  //   final data = {'email': email, 'password': password};
  //   try {
  //     final res = await HttpHelper.post(_loginApi, data);
  //     return res;
  //   } on Exception catch (_) {
  //     rethrow;
  //   }
  // }

  Future<LoginResponse> login(String email, String password) async {
    final data = {'email': email, 'password': password};
    try {
      final res = await HttpHelper.post(_loginApi, data);
      final loginResponse = LoginResponse.fromJson(res["data"]);
      return loginResponse;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<UserModel> register(UserModel newUser) async {
    final data = newUser.toJson();
    try {
      final res = await HttpHelper.post(_registerApi, data);
      final newUser = UserModel.fromJson(res["data"]["user"]);
      return newUser;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<String> verifyOTP(String email, String otp) async {
    final data = {
      "email": email,
      "otp": otp,
    };
    try {
      final res = await HttpHelper.post(_verifyOTPApi, data);
      return res["message"];
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<String> resendOTP(String email) async {
    final data = {"email": email};
    try {
      final res = await HttpHelper.post(_resendOTPApi, data);
      return res["message"];
    } on Exception catch (_) {
      rethrow;
    }
  }

  // void sendOTP(String email) async {
  //   final data = {"email": email};
  //   try {
  //     await HttpHelper.post(_sendOTPApi, data);
  //   } on Exception catch (_) {
  //     rethrow;
  //   }
  // }
}
