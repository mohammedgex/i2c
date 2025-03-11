// ignore_for_file: empty_statements

import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/sharedPref.dart';
import 'package:skill_grow/core/global/api_endpoint.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';
import 'package:skill_grow/features/cart/controller/cart_list_controller.dart';
import 'package:skill_grow/features/cart/model/cart_list_model.dart';
import 'package:skill_grow/features/navigation_bar/views/bottom_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/payment_url_model.dart';
import '../view/error_view.dart';

class PaymentUrlController extends GetxController {
  final CartListController _cartListController = Get.put(CartListController());
  final dio.Dio _dio = dio.Dio(
    dio.BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      responseType: dio.ResponseType.json,
    ),
  );

  // Track loading state for each payment method
  final RxMap<String, bool> _isLoadingMap = <String, bool>{}.obs;
  final RxString _errorMessage = ''.obs;

  // Getters for reactive variables
  bool isLoading(String method) => _isLoadingMap[method] ?? false;
  String get errorMessage => _errorMessage.value;

  Future<void> initiatePayment(String paymentMethod) async {
    // Set loading state for the specific payment method
    _isLoadingMap[paymentMethod] = true;
    _errorMessage.value = '';

    try {
      final String currencyCode = await SharedPrefUtil.get('currency_code', 'USD');
      final String token = await SharedPrefUtil.get('token', '');

      final response = await _dio.get(
        ApiEndpoint.paymentApiUrl(method: paymentMethod.toLowerCase(), currency: currencyCode),
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      _handlePaymentResponse(response);
    } on dio.DioException catch (e) {
      _handleDioError(e);
    } on SocketException {
      _handleError('No internet connection.', 'Please check your connection and try again.');
    } catch (e) {
      _handleError('An unexpected error occurred.', 'Please try again later.');
    } finally {
      // Reset loading state for the specific payment method
      _isLoadingMap[paymentMethod] = false;
    }
  }

  void _handlePaymentResponse(dio.Response response) {
    if ((response.statusCode == 200 || response.statusCode == 201) && response.data != null) {
      final paymentData = PaymentUrlResponseModel.fromJson(response.data);
      _clearCartData();
      _launchPaymentUrl(paymentData.url);
      _navigateToHome();
    } else {
      _handleErrorResponse(response);
    }
  }

  void _clearCartData() {
    _cartListController.cartData.value = CartData(
      totalQty: 0,
      totalAmount: '',
      cartCourses: [],
    );
    _cartListController.cartData.close();
  }

  Future<void> _launchPaymentUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      _handleError('Failed to launch payment URL.', 'Try using a different payment method.');
    }
  }

  void _navigateToHome() {
  try {
    Get.offAll(() => CustomPersistentBottomNavBar());
  } catch (e) {
    print("Navigation error: $e");
    // Handle the error (e.g., show a snackbar or navigate to an error page)
  }
}
  void _handleErrorResponse(dio.Response response) {
    final errorData = PaymentErrorResponseModel.fromJson(response.data ?? {});
    _handleError(errorData.message, errorData.supportCurrency);
  }

  void _handleDioError(dio.DioException e) {
    final errorMsg = e.response?.data['message'] ?? 'Something went wrong';
    final supportCurrency = e.response?.data['supportCurrency'];
    _handleError(errorMsg, supportCurrency);
  }

  void _handleError(String message, String? supportCurrency) {
    if (supportCurrency != null && supportCurrency.isNotEmpty) {
      Get.off(
        () => ErrorPage(),
        arguments: PaymentErrorResponseModel(
          status: 'error',
          message: message,
          supportCurrency: supportCurrency,
        ),
      );
    } else {
      customSnackbar(
        title: 'Error',
        message: message,
        type: CustomSnackbarType.failed,
      );
    }
  }
}