import 'dart:io';
import 'package:dio/dio.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';

class GlobalErrorHandler {
  // Method to handle different error types
  static void handleError(Object error) {
    String errorMessage = 'An unknown error occurred.';

    if (error is DioException) {
      // If API response contains a message, use it
      if (error.response != null && error.response!.data != null) {
        errorMessage = _getApiErrorMessage(error.response!);
      } else {
        // Fallback error handling based on Dio error type
        errorMessage = _handleDioError(error);
      }
    } else if (error is SocketException) {
      errorMessage = 'No internet connection. Please check your connection.';
    } else {
      errorMessage = 'Unexpected error occurred. Please try again.';
    }

    // Show error message in Snackbar
    customSnackbar(
      title: "Error",
      message: errorMessage,
      type: CustomSnackbarType.failed,
    );
  }

  // Extract API error message from response
  static String _getApiErrorMessage(Response response) {
    try {
      if (response.data is Map<String, dynamic> &&
          response.data.containsKey('message')) {
        return response.data['message'] ?? 'An error occurred.';
      }
    } catch (e) {
      return 'Error parsing API error message.';
    }
    return 'An unknown API error occurred.';
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
        return 'Unexpected server response.';
      case DioExceptionType.unknown:
      default:
        return 'An unexpected error occurred.';
    }
  }
}
