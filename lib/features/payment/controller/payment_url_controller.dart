import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/Global/sharedPref.dart';
import '../model/payment_url_model.dart';
import '../view/error_view.dart';

class PaymentUrlController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final dio.Dio _dio = dio.Dio(
    dio.BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      responseType: dio.ResponseType.json,
    ),
  );

  Future<void> initiatePayment(String method) async {
    isLoading.value = true;
    errorMessage.value = '';
    String token = await SharedPrefUtil.get("token", '');
    try {
      dio.Response? response = await _dio.get(
        ApiEndpoint.paymentApiUrl(
            method: method.toLowerCase(), currency: 'BDT'),
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print("Response: \${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        var paymentData = PaymentUrlResponseModel.fromJson(response.data);
        _launchURL(paymentData.url);
      } else {
        _handleErrorResponse(response);
      }
    } on dio.DioException catch (e) {
      String errorMsg = e.response?.data['message'] ?? "Something went wrong";
      String? supportCurrency = e.response?.data['supportCurrency'];
      _handleErrorOrNavigate(errorMsg, supportCurrency);
      print("Error: \${e.response?.data}");
    } on SocketException {
      _handleErrorOrNavigate("No internet connection.",
          "Please check your connection and try again.");
      print("No internet connection");
    } catch (e) {
      _handleErrorOrNavigate(
          "An unexpected error occurred.", "Please try again later.");
      print("Error: \$e");
    } finally {
      isLoading.value = false;
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
