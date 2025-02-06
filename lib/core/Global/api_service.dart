import 'dart:io';
import 'package:dio/dio.dart';
import 'package:skill_grow/core/Global/error_handler.dart';
import 'package:skill_grow/core/Global/sharedPref.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
            responseType: ResponseType.json,
          ),
        );

  // Generic API call method
  Future<Response?> request({
    required String url,
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
     bool showSnackbar = false, // New parameter
  }) async {
    try {
      // Set Authorization Header
      if (requiresAuth) {
        String token = await SharedPrefUtil.get("token", '');
        _dio.options.headers['Authorization'] = 'Bearer $token';
      } else {
        _dio.options.headers.remove('Authorization');
      }

      // Make the request based on the method
      Response response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _dio.get(url,
              queryParameters: queryParameters,
              options: Options(contentType: "application/json"));
          break;
        case 'POST':
          response = await _dio.post(url,
              data: data, options: Options(contentType: "application/json"));
          break;
        case 'PUT':
          response = await _dio.put(url,
              data: data, options: Options(contentType: "application/json"));
          break;
        case 'DELETE':
          response = await _dio.delete(url,
              data: data, options: Options(contentType: "application/json"));
          break;
        default:
          throw UnsupportedError('HTTP method not supported: $method');
      }

      // Log the response
      print("API Response (${response.statusCode}): ${response.data}");

      return response;
    } on DioException catch (e) {
      print("API Error: ${e.response?.statusCode} -> ${e.response?.data}");
      GlobalErrorHandler.handleError(e);
    } on SocketException {
      print("Network Error: No internet connection.");
      GlobalErrorHandler.handleError(
          'No internet connection. Please try again.');
    } catch (e) {
      print("Unexpected Error: $e");
      GlobalErrorHandler.handleError(e.toString());
    }

    return null;
  }

  // Example: GET API
  Future<Response?> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
  }) async {
    return await request(
      url: url,
      method: 'GET',
      queryParameters: queryParameters,
      requiresAuth: requiresAuth,
    );
  }

  // Example: POST API
  Future<Response?> postData({
    required String url,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
  }) async {
    return await request(
      url: url,
      method: 'POST',
      data: data,
      requiresAuth: requiresAuth,
    );
  }

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
  }) async {
    return await request(
      url: url,
      method: 'PUT',
      data: data,
      requiresAuth: requiresAuth,
    );
  }

  Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
  }) async {
    return await request(
      url: url,
      method: 'DELETE',
      requiresAuth: requiresAuth,
    );
  }
}
