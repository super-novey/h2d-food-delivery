import 'package:food_delivery_h2d/features/restaurants/menu_management/models/category_model.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  

  Future<List<Category>> getCategoriesInRestaurant(String partnerId) async {
    try {
      final res = await HttpHelper.get("category/${partnerId.toString()}");
      final list = (res["data"] as List)
          .map((category) => Category.fromJson(category))
          .toList();

      return list;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> removeCategory(String categoryId) async {
    try {
      await HttpHelper.delete("category/${categoryId.toString()}");
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Category> addCategory(Category newCategory) async {
    final reqBody = newCategory.toJson();
    try {
      final res = await HttpHelper.post("category", reqBody);
      print(res);
      final categoryData = res["data"]["newCategory"];

      return Category.fromJson(categoryData);
    } on Exception catch (_) {
      rethrow;
    }
  }
}