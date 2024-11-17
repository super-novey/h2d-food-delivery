import 'package:food_delivery_h2d/features/admin/user_management/models/user_model.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  Future<List<UserModel>> fetchAllUsers() async {
    try {
      final response = await HttpHelper.get(
          "user");
          print(response);
      List<dynamic> data = response['data'] as List<dynamic>;
      print(data);
      return data.map((item) => UserModel.fromJson(item)).toList();
    } on Exception catch (_) {
      rethrow;
    }
  }



}
