// ignore_for_file: empty_statements

import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';
import 'package:skill_grow/features/cart/controller/cart_list_controller.dart';
import 'package:skill_grow/features/cart/model/cart_list_model.dart';
import 'package:skill_grow/features/navigation_bar/views/bottom_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/Global/sharedPref.dart';
import '../model/payment_url_model.dart';
import '../view/error_view.dart';

class PaymentUrlController extends GetxController {
  CartListController cartListController = Get.put(CartListController());
  // Track loading state for each payment method
  var isLoadingMap = <String, bool>{}.obs;

  var errorMessage = ''.obs;

  final dio.Dio _dio = dio.Dio(
    dio.BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      responseType: dio.ResponseType.json,
    ),
  );

  Future<void> initiatePayment(String method) async {
    // Set loading state for the specific payment method
    isLoadingMap[method] = true;
    errorMessage.value = '';
    String currency_code = await SharedPrefUtil.get('currency_code', 'USD');
    String token = await SharedPrefUtil.get("token", '');
    try {
      dio.Response? response = await _dio.get(
        ApiEndpoint.paymentApiUrl(
            method: method.toLowerCase(), currency: currency_code),
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print("Response: ${response.data}");

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != null) {
        var paymentData = PaymentUrlResponseModel.fromJson(response.data);
        cartListController.cartData.value = CartData(totalQty: 0, totalAmount: '', cartCourses: []); // Assuming cartData is a List
        cartListController.cartData.close();
        _launchURL(paymentData.url);
        print("Payment URL: ${paymentData.url}");
        Get.offAll(() => CustomPersistentBottomNavBar());
      } else {
        _handleErrorResponse(response);
      }
    } on dio.DioException catch (e) {
      String errorMsg = e.response?.data['message'] ?? "Something went wrong";
      String? supportCurrency = e.response?.data['supportCurrency'];
      _handleErrorOrNavigate(errorMsg, supportCurrency);
      print("Error: ${e.response?.data}");
    } on SocketException {
      _handleErrorOrNavigate("No internet connection.",
          "Please check your connection and try again.");
      print("No internet connection");
    } catch (e) {
      _handleErrorOrNavigate(
          "An unexpected error occurred.", "Please try again later.");
      print("Error: $e");
    } finally {
      // Reset loading state for the specific payment method
      isLoadingMap[method] = false;
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      _handleErrorOrNavigate("Failed to launch payment URL.",
          "Try using a different payment method.");
    }
  }

  void _handleErrorResponse(dio.Response response) {
    var errorData = PaymentErrorResponseModel.fromJson(response.data ?? {});
    _handleErrorOrNavigate(errorData.message, errorData.supportCurrency);
  }

  void _handleErrorOrNavigate(String message, String? supportCurrency) {
    if (supportCurrency != null && supportCurrency.isNotEmpty) {
      Get.off(() => ErrorPage(),
          arguments: PaymentErrorResponseModel(
            status: "error",
            message: message,
            supportCurrency: supportCurrency,
          ));
    } else {
      customSnackbar(
          title: "Error", message: message, type: CustomSnackbarType.failed);
    }
  }
}
