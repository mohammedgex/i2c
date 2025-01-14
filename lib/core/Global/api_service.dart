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
            responseType: ResponseType.json,
          ),
        );

  // Generic API call method
  Future<Response?> request({
    required String url,
    required String method,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
  }) async {
    try {
      // Add Authorization header only when required
      if (requiresAuth) {
        _dio.options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE';
      } else {
        _dio.options.headers.remove('Authorization');
      }

      // Make the request based on the method
      Response response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _dio.get(url, options: Options(contentType: "application/json"));
          break;
        case 'POST':
          response = await _dio.post(url, data: data);
          break;
        case 'PUT':
          response = await _dio.put(url, data: data);
          break;
        case 'DELETE':
          response = await _dio.delete(url, data: data);
          break;
        default:
          throw UnsupportedError('HTTP method not supported: $method');
      }

      // Handle successful response
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else {
        // Handle non-successful status codes
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      GlobalErrorHandler.handleError(e);
    } on SocketException {
      // Handle network issues
      GlobalErrorHandler.handleError('No internet connection. Please try again.');
    } catch (e) {
      // Handle any other exceptions
      GlobalErrorHandler.handleError(e);
    }

    // Return null or throw an exception based on how you want to handle this
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
}
