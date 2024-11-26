import 'package:food_delivery_h2d/data/response/api_response.dart';
import 'package:food_delivery_h2d/features/shippers/home/models/order_model.dart';
import 'package:food_delivery_h2d/utils/http/http_client.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  Future<List<Order>> getAllOrders() async {
    try {
      final res = await HttpHelper.get("order");
      if (res["hasError"] == true) {
        throw Exception(res["message"]);
      }
      final list =
          (res["data"] as List).map((order) => Order.fromJson(order)).toList();
      return list;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<List<Order>> getOrdersByStatus({String? custStatus}) async {
    try {
      String url = "order/orders/status";
      if (custStatus != null) {
        url += "?custStatus=$custStatus";
      }

      final response = await HttpHelper.get(url);
      List<dynamic> data = response['data'] as List<dynamic>;

      return data.map((item) => Order.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches all orders for a specific customer.
  Future<List<Order>> getOrdersByCustomerID(String customerId) async {
    try {
      final res =
          await HttpHelper.get("order/customer/${customerId.toString()}");
      final list =
          (res["data"] as List).map((order) => Order.fromJson(order)).toList();
      return list;
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Places a new order.
  Future<ApiResponse<Order>> placeOrder(Order newOrder) async {
    try {
      final res = await HttpHelper.post("order", newOrder.toJson());
      if (res["hasError"] == true) {
        return ApiResponse.error(res["message"]);
      }
      final result = Order.fromJson(res["data"]);
      return ApiResponse.completed(result, res["message"]);
    } catch (e) {
      print(e);
      return ApiResponse.error("An unknown error occurred.");
    }
  }

  /// Updates the status of an order.
  Future<ApiResponse<Order>> updateOrderStatus(
      String orderId, String newStatus) async {
    try {
      final res = await HttpHelper.put(
        "order/${orderId.toString()}",
        {"status": newStatus},
      );
      if (res["hasError"] == true) {
        return ApiResponse.error(res["message"]);
      }
      final result = Order.fromJson(res["data"]);
      return ApiResponse.completed(result, res["message"]);
    } catch (e) {
      print(e);
      return ApiResponse.error("An unknown error occurred.");
    }
  }

  /// Deletes an order by its ID.
  Future<ApiResponse<String>> deleteOrder(String orderId) async {
    try {
      final res = await HttpHelper.delete("order/${orderId.toString()}");
      if (res["hasError"] == true) {
        return ApiResponse.error(res["message"]);
      }
      return ApiResponse.completed(orderId, res["message"]);
    } catch (e) {
      print(e);
      return ApiResponse.error("An unknown error occurred.");
    }
  }
}
