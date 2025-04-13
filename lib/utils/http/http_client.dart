import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpHelper {
  static final String _baseUrl =
      dotenv.env['BASE_URL'] ?? "http://localhost:8081/api/v1";

  static final Logger _logger = Logger();

  static void _logRequest(String method, String url,
      {Map<String, String>? headers, dynamic body}) {
    _logger.i('[$method] Request → $url');
    if (headers != null) _logger.d('Headers: $headers');
    if (body != null) _logger.d('Body: $body');
  }

  static void _logResponse(http.Response response) {
    _logger.i('Response [${response.statusCode}]');
    _logger.d('Body: ${response.body}');
  }

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final url = '$_baseUrl/$endpoint';
    _logRequest('GET', url);

    final response = await http.get(Uri.parse(url));
    _logResponse(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final url = '$_baseUrl/$endpoint';
    final encoded = json.encode(data);
    _logRequest('POST', url, headers: {'Content-Type': 'application/json'}, body: encoded);

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: encoded,
    );
    _logResponse(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, [dynamic data]) async {
    final url = '$_baseUrl/$endpoint';
    final encoded = data != null ? json.encode(data) : null;
    _logRequest('PUT', url, headers: {'Content-Type': 'application/json'}, body: encoded);

    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: encoded,
    );
    _logResponse(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> patch(String endpoint, [dynamic data]) async {
    final url = '$_baseUrl/$endpoint';
    final encoded = data != null ? json.encode(data) : null;
    _logRequest('PATCH', url, headers: {'Content-Type': 'application/json'}, body: encoded);

    final response = await http.patch(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: encoded,
    );
    _logResponse(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = '$_baseUrl/$endpoint';
    _logRequest('DELETE', url);

    final response = await http.delete(Uri.parse(url));
    _logResponse(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> postWithFiles(
      String endpoint, dynamic fields, List<http.MultipartFile> files) async {
    final url = '$_baseUrl/$endpoint';
    _logger.i('[POST - Multipart] → $url');
    _logger.d('Fields: $fields');
    _logger.d('Files: ${files.map((f) => f.filename).toList()}');

    var request = http.MultipartRequest('POST', Uri.parse(url));
    fields.forEach((key, value) {
      request.fields[key] = value.toString();
    });
    request.files.addAll(files);

    var response = await request.send();
    return await _handleMultipartResponse(response);
  }

  static Future<Map<String, dynamic>> putWithFiles(
      String endpoint, dynamic fields, List<http.MultipartFile> files) async {
    final url = '$_baseUrl/$endpoint';
    _logger.i('[PUT - Multipart] → $url');
    _logger.d('Fields: $fields');
    _logger.d('Files: ${files.map((f) => f.filename).toList()}');

    var request = http.MultipartRequest('PUT', Uri.parse(url));
    fields.forEach((key, value) {
      request.fields[key] = value.toString();
    });
    request.files.addAll(files);

    var response = await request.send();
    return await _handleMultipartResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if ([200, 201, 401, 404, 409].contains(response.statusCode)) {
      return json.decode(response.body);
    } else {
      _logger.e('Unexpected Error: ${response.statusCode} - ${response.body}');
      throw Exception(response.body);
    }
  }

  static Future<Map<String, dynamic>> _handleMultipartResponse(
      http.StreamedResponse response) async {
    final responseBody = await response.stream.bytesToString();
    _logger.i('Multipart Response [${response.statusCode}]');
    _logger.d('Body: $responseBody');

    if ([200, 201].contains(response.statusCode)) {
      return json.decode(responseBody);
    } else {
      _logger.e('Error: ${response.statusCode}, $responseBody');
      throw Exception('Error: ${response.statusCode}, $responseBody');
    }
  }
}
