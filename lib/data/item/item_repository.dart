import 'package:food_delivery_h2d/data/response/api_response.dart';
import 'package:food_delivery_h2d/features/customers/search/models/item_model.dart';
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

  Future<ApiResponse<Item>> updateItem(
      Item oldItem, List<http.MultipartFile>? files) async {
    try {
      final res = await HttpHelper.putWithFiles(
          "item/${oldItem.itemId.toString()}", oldItem.toJson(), files ?? []);
      if (res["hasError"] == true) {
        return ApiResponse.error(res["message"]);
      }
      final result = Item.fromJson(res["data"]);
      return ApiResponse.completed(result, res["message"]);
    } catch (e) {
      print(e);
      return ApiResponse.error("An unknown error occurred.");
    }
  }

  Future<void> removeItem(String itemId) async {
    try {
      await HttpHelper.delete("item/${itemId.toString()}");
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<ApiResponse<Item>> addItem(
      Item newItem, List<http.MultipartFile> files) async {
    try {
      final res =
          await HttpHelper.postWithFiles("item", newItem.toJson(), files);
      if (res["hasError"] == true) {
        return ApiResponse.error(res["message"]);
      }
      final result = Item.fromJson(res["data"]);
      return ApiResponse.completed(result, res["message"]);
    } catch (e) {
      print(e);
      return ApiResponse.error("An unknown error occurred.");
    }
  }

  Future<List<ItemModel>> searchItems(String query) async {
    try {
      final response =
          await HttpHelper.get("item/customer/search?query=$query");

      List<dynamic> data = response['data'] as List<dynamic>;

      return data.map((item) => ItemModel.fromJson(item)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
