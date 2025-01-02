import 'dart:io';
import 'dart:js_interop';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/texts.dart';

class GlobalErrorHandler {

  // Method to handle different error types
  static handleError(Object error) {
    String errorMessage =  'An unknown error occurred.';

    if (error is DioError) {
      // Handling Dio errors
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout. Please try again later.';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Server took too long to respond. Please try again.';
          break;
        case DioExceptionType.badResponse:
          // Handling HTTP errors
          if (error.response != null) {
            if (error.response?.statusCode == 404) {
              errorMessage = 'Resource not found (404).';
            } else if (error.response?.statusCode == 401) {
              errorMessage = 'Unauthorized access. Please log in again.';
            } else {
              errorMessage = 'Server error: ${error.response?.statusCode}.';
            }
          } else {
            errorMessage = 'No response from server.';
          }
          break;
        case DioExceptionType.unknown:
          // Network errors or other unknown errors
          if (error.error is SocketException) {
            errorMessage = 'No internet connection. Please check your connection.';
          } else {
            errorMessage = 'An unexpected error occurred.';
          }
          break;
        case DioExceptionType.sendTimeout:
          // TODO: Handle this case.
          throw UnimplementedError();
        case DioExceptionType.badCertificate:
          // TODO: Handle this case.
          throw UnimplementedError();
        case DioExceptionType.cancel:
          // TODO: Handle this case.
          throw UnimplementedError();
        case DioExceptionType.connectionError:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    } else if (error is FormatException) {
      errorMessage = 'The data format is invalid. Please contact support.';
    } else if (error is SocketException) {
      errorMessage = 'No internet connection. Please check your connection.';
    } else if (error is NullRejectionException || error is TypeError) {
      errorMessage = 'Unexpected error occurred. Please try again.';
    } else {
      errorMessage = 'Unknown error occurred. Please try again.';
    }

    // Show the error using a Snackbar or a Dialog
    showErrorDialog(errorMessage);
  }

  // Show error dialog
  static showErrorDialog(String message) {
    // Show a dialog or snackbar based on your requirement
    // For example, show a simple dialog
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: GlobalText(text:'Error', softWrap: false,),
        content: GlobalText(text: message, softWrap: true,),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
