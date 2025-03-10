import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:get/get.dart' as getx;
import 'package:skill_grow/core/widgets/snackbar.dart';
// import 'package:skill_grow/features/authentication/view/login_view.dart';

class GlobalErrorHandler {
  // Method to handle different error types
  static void handleError(Object error, {bool showSnackbar = true}) {
    String errorMessage = 'An unknown error occurred.';

    if (error is DioException) {
      if (error.response != null && error.response!.data != null) {
        errorMessage = _getApiErrorMessage(error.response!);
      } else {
        errorMessage = _handleDioError(error);
      }
    } else if (error is SocketException) {
      errorMessage = 'No internet connection. Please check your connection.';
    } else {
      errorMessage = 'Unexpected error occurred. Please try again.';
    }

    // Show Snackbar only if enabled
    if (showSnackbar) {
      customSnackbar(
        title: "Error",
        message: errorMessage,
        type: CustomSnackbarType.failed,
      );
    }
  }

  // Extract API error message from response
  static String _getApiErrorMessage(Response response) {
    try {
      if (response.data is Map<String, dynamic>) {
        var data = response.data;
        print(response.statusCode);

        // if (response.statusCode == 401) {
        //   getx.Get.to(()=> LoginView());
        // }

        // Check if the message is in the 'message' or 'error' field
        if (data.containsKey('message')) {
          var message = data['message'];

          // Handle if the message is a Map or List
          if (message is Map<String, dynamic>) {
            // Recursively process if the message is a nested structure
            return _extractErrorMessage(message);
          } else if (message is List) {
            return message.isNotEmpty ? message.first : 'An error occurred.';
          } else {
            return message ?? 'An error occurred.';
          }
        }

        // Handle other common fields for error messages
        if (data.containsKey('error')) {
          var error = data['error'];
          return error ?? 'An error occurred.';
        }

        if (data.containsKey('detail')) {
          var detail = data['detail'];
          return detail ?? 'An error occurred.';
        }
      }
    } catch (e) {
      return 'Error parsing API error message.';
    }

    return 'An unknown API error occurred.';
  }

  static String _extractErrorMessage(dynamic message) {
    // If message is a Map, recursively look for key with error message
    if (message is Map<String, dynamic>) {
      for (var key in message.keys) {
        var value = message[key];

        // If the value is a string, return it as the error message
        if (value is String) {
          return value;
        }

        // If the value is a list, return the first element if it's a string
        if (value is List && value.isNotEmpty && value.first is String) {
          return value.first;
        }

        // If it's a nested map, recursively extract the error message
        if (value is Map) {
          var nestedMessage = _extractErrorMessage(value);
          if (nestedMessage.isNotEmpty) return nestedMessage;
        }
      }
    }

    return 'An unknown error occurred.';
  }

  // Handle Dio-specific errors
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again later.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond. Please try again.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again later.';
      case DioExceptionType.cancel:
        return 'Request was cancelled. Please try again.';
      case DioExceptionType.badCertificate:
        return 'Invalid SSL certificate. Please check your connection.';
      case DioExceptionType.connectionError:
        return 'Connection error. Please check your network.';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.unknown:
      default:
        return 'An unexpected error occurred.';
    }
  }

  // Handle Bad Response (e.g., 400, 401, 403, 500)
  static String _handleBadResponse(DioException error) {
    int? statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized access. Please login again.';
      case 403:
        return 'Access forbidden. You do not have permission.';
      case 404:
        return 'Requested resource not found.';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return 'Server error. Please try again.';
    }
  }
}
