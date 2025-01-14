import 'dart:io';
import 'package:dio/dio.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';

class GlobalErrorHandler {
  // Method to handle different error types
  static void handleError(Object error) {
    String errorMessage = 'An unknown error occurred.';

    if (error is DioException) {
      // Handling Dio errors
      if (error.response != null && error.response!.data != null) {
        // If API response contains a message
        errorMessage = _getApiErrorMessage(error.response!);
      } else {
        // Fallback error handling based on Dio error type
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = 'Connection timeout. Please try again later.';
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = 'Server took too long to respond. Please try again.';
            break;
          case DioExceptionType.badResponse:
            if (error.response != null) {
              errorMessage = _handleHttpError(error.response!.statusCode);
            } else {
              errorMessage = 'No response from server.';
            }
            break;
          case DioExceptionType.unknown:
            if (error.error is SocketException) {
              errorMessage =
                  'No internet connection. Please check your connection.';
            } else {
              errorMessage = 'An unexpected error occurred.';
            }
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = 'Request timeout. Please try again later.';
            break;
          case DioExceptionType.badCertificate:
            errorMessage =
                'Invalid SSL certificate. Please check your connection.';
            break;
          case DioExceptionType.cancel:
            errorMessage = 'Request was cancelled. Please try again.';
            break;
          case DioExceptionType.connectionError:
            errorMessage = 'Connection error. Please check your network.';
            break;
          default:
            errorMessage = 'An unknown Dio error occurred.';
            break;
        }
      }
    } else if (error is FormatException) {
      errorMessage = 'The data format is invalid. Please contact support.';
    } else if (error is SocketException) {
      errorMessage = 'No internet connection. Please check your connection.';
    } else {
      errorMessage = 'Unexpected error occurred. Please try again.';
    }

    // Show the error using a custom Snackbar
    customSnackbar(
      title: "Error",
      message: errorMessage,
      type: CustomSnackbarType.failed,
    );
  }

  // Get error message from API response
  static String _getApiErrorMessage(Response response) {
    try {
      // Assuming the API error message is within the `message` field in the response
      // Adjust this depending on your API's error response structure
      if (response.data is Map<String, dynamic> &&
          response.data['message'] != null) {
        return response.data['message'] ?? 'An error occurred';
      }
    } catch (e) {
      return 'Error parsing API error message.';
    }
    return 'An unknown API error occurred.';
  }

  // Handle specific HTTP errors
  static String _handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please try again.';
      case 401:
        return 'Unauthorized access. Please log in again.';
      case 403:
        return 'Forbidden request. You don’t have permission.';
      case 404:
        return 'Resource not found (404).';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return 'Server error: $statusCode.';
    }
  }
}
