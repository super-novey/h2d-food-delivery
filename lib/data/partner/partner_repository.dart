import 'package:food_delivery_h2d/features/authentication/models/PartnerModel.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class PartnerRepository extends GetxController {
  static PartnerRepository get instance => Get.find();

  static const String _driverApi = "partner";

  Future<PartnerModel> getCurrentPartner(String userId) async {
    try {
      final res = await HttpHelper.get("$_driverApi/${userId.toString()}");
      return PartnerModel.fromJson(res["data"]);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
