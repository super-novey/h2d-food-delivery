import 'package:food_delivery_h2d/features/restaurants/menu_management/models/item_model.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ItemRepository extends GetxController {
  static ItemRepository get instance => Get.find();

  Future<List<Item>> getItemsByCategoryID(String categoryId) async {
    try {
      final res =
          await HttpHelper.get("item/category/${categoryId.toString()}");
      final list = (res["data"] as List)
          .map((category) => Item.fromJson(category))
          .toList();

      return list;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Item> addItem(Item newItem, List<http.MultipartFile> files) async {
    try {
      final res =
          await HttpHelper.postWithFiles("item", newItem.toJson(), files);
      return Item.fromJson(res["data"]);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
