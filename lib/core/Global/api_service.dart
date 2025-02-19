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
    bool showSnackbar = true,
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
      // print("API Response (${response.statusCode}): ${response.data}");

      return response;
    } on DioException catch (e) {
      // Use GlobalErrorHandler to manage the error message
      GlobalErrorHandler.handleError(e, showSnackbar: showSnackbar);
    } on SocketException {
      // Handle no internet connection
      print("Network Error: No internet connection.");
      GlobalErrorHandler.handleError(
          'No internet connection. Please try again.', showSnackbar: showSnackbar);
    } catch (e) {
      // Handle unexpected errors
      print("Unexpected Error: $e");
      GlobalErrorHandler.handleError(e.toString(), showSnackbar: showSnackbar);
    }

    return null;
  }

  Future<Response?> requests({
    required String url,
    required String method,
    FormData? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
    bool showSnackbar = true,
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
      // print("API Response (${response.statusCode}): ${response.data}");

      return response;
    } on DioException catch (e) {
      // Use GlobalErrorHandler to manage the error message
      GlobalErrorHandler.handleError(e, showSnackbar: showSnackbar);
    } on SocketException {
      // Handle no internet connection
      print("Network Error: No internet connection.");
      GlobalErrorHandler.handleError(
          'No internet connection. Please try again.', showSnackbar: showSnackbar);
    } catch (e) {
      // Handle unexpected errors
      print("Unexpected Error: $e");
      GlobalErrorHandler.handleError(e.toString(), showSnackbar: showSnackbar);
    }

    return null;
  }

  Future<Response?> uploadImage({
    required String url,
    required File imageFile,
    bool requiresAuth = true,
    bool showSnackbar = true,
  }) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      return await requests(
        url: url,
        method: 'POST',
        data: formData,
        requiresAuth: requiresAuth,
        showSnackbar: showSnackbar,
      );
    } catch (e) {
      GlobalErrorHandler.handleError(e.toString(), showSnackbar: showSnackbar);
      return null;
    }
  }

  // Example: GET API
  Future<Response?> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
    bool showSnackbar = true,
  }) async {
    return await request(
      url: url,
      method: 'GET',
      queryParameters: queryParameters,
      requiresAuth: requiresAuth,
      showSnackbar: showSnackbar,
    );
  }

  // Example: POST API
  Future<Response?> postData({
    required String url,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
    bool showSnackbar = true,
  }) async {
    return await request(
      url: url,
      method: 'POST',
      data: data,
      requiresAuth: requiresAuth,
      showSnackbar: showSnackbar,
    );
  }

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
    bool showSnackbar = true,
  }) async {
    return await request(
      url: url,
      method: 'PUT',
      data: data,
      requiresAuth: requiresAuth,
      showSnackbar: showSnackbar,
    );
  }

  Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
    bool showSnackbar = true,
  }) async {
    return await request(
      url: url,
      method: 'DELETE',
      requiresAuth: requiresAuth,
      showSnackbar: showSnackbar,
    );
  }
}
