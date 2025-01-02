import 'dart:io';
import 'package:dio/dio.dart';
import 'package:skill_grow/core/Global/error_handler.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

  // Generic API call method
  Future<Response> request({
    required String url,
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true, // Optional authorization
  }) async {
    try {
      // Add Authorization header only when required
      if (requiresAuth) {
        _dio.options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE';
      } else {
        _dio.options.headers.remove('Authorization');
      }

      // Make the request based on the method
      switch (method.toUpperCase()) {
        case 'GET':
          return await _dio.get(url, queryParameters: queryParameters);
        case 'POST':
          return await _dio.post(url, data: data);
        case 'PUT':
          return await _dio.put(url, data: data);
        case 'DELETE':
          return await _dio.delete(url);
        default:
          throw UnsupportedError('HTTP method not supported');
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      throw GlobalErrorHandler.handleError(e);
    } on SocketException{
      // Handle network issues
      throw GlobalErrorHandler.handleError('No internet connection');
    } catch (e) {
      // Handle any other exceptions
      throw GlobalErrorHandler.handleError(e);
    }
  }

  // Example: GET API
  Future<Response> getData({
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
  Future<Response> postData({
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
}
