import 'dart:convert';
import 'package:crypto/crypto.dart'; // Dùng để tạo HMAC
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ZaloPayService {
  static const MethodChannel _channel =
      MethodChannel('flutter.native/channelPayOrder');

  static const String appId = "2554";
  static const String key1 = "sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn";
  static const String endpoint = "https://sb-openapi.zalopay.vn/v2/create";

  /// 🔹 **Tạo đơn hàng trên ZaloPay**
  static Future<Map<String, dynamic>> createOrder(int amount) async {
    final int appTime = DateTime.now().millisecondsSinceEpoch;
    final String appTransId =
        "${DateTime.now().year}${DateTime.now().month.toString().padLeft(2, '0')}${DateTime.now().day.toString().padLeft(2, '0')}_${appTime}";
    print(appTime);
    print(appTransId);
    print("Generated MAC: ${generateMac(appId, appTransId, appTime, amount)}");

    final Map<String, dynamic> orderData = {
      "app_id": appId,
      "app_trans_id": appTransId,
      "app_user": "user123",
      "app_time": appTime,
      "amount": amount,
      "description": "Thanh toán đơn hàng #$appTransId",
      "mac": generateMac(appId, appTransId, appTime, amount),
    };

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(orderData),
    );

    if (response.statusCode == 200) {
      print('RESPONSE: $response');
      return jsonDecode(response.body);
    } else {
      print("Lỗi khi tạo đơn hàng: ${response.body}");
      print("Response code: ${response.statusCode}");
      print("Response body: ${response.body}");

      throw Exception("Lỗi khi tạo đơn hàng ZaloPay");
    }

    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body);
    // } else {
    //   throw Exception("Lỗi khi tạo đơn hàng ZaloPay");
    // }
  }

  static Future<void> payWithZaloPay(String token) async {
    try {
      print('TOKEN $token');
      final result =
          await _channel.invokeMethod('payWithZaloPay', {"token": token});
      print("Kết quả thanh toán: $result");

      // 📌 Mở app ZaloPay Sandbox nếu có token
      if (token.isNotEmpty) {
        final Uri zalopayUri = Uri.parse("zalopay://app?zptranstoken=$token");
        if (await canLaunchUrl(zalopayUri)) {
          await launchUrl(zalopayUri, mode: LaunchMode.externalApplication);
        } else {
          print("Không thể mở ứng dụng ZaloPay");
        }
      }
    } on PlatformException catch (e) {
      print("Lỗi khi gọi ZaloPay SDK: ${e.message}");
    }
  }

  /// 🔹 **Hàm tạo MAC (Mã bảo mật)**
  static String generateMac(
      String appId, String appTransId, int appTime, int amount) {
    String data = "$appId|$appTransId|$appTime|$amount|$key1";
    return generateHmacSHA256(data, key1);
  }

  static String generateHmacSHA256(String data, String key) {
    var hmac = Hmac(sha256, utf8.encode(key));
    return hmac.convert(utf8.encode(data)).toString();
  }
}
