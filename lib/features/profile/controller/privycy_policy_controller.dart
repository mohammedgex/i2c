import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';

import '../../../core/Global/api_service.dart';


class PrivacyPolicyController extends GetxController {
  var isLoading = false.obs;
  var privacyPolicyContent = "".obs;
  var errorMessage = "".obs;


  @override
  void onInit() {
    super.onInit();
    fetchPrivacyPolicy();
  }

  // Method to fetch privacy policy
  Future<void> fetchPrivacyPolicy() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      ApiService apiService = ApiService();
      String url = ApiEndpoint.privecyPolicyUrl(languageCode: "en"); // Replace with your API URL

      dio.Response? response = await apiService.getData(url: url, requiresAuth: false);

      if (response != null && response.statusCode == 200) {
        var data = response.data;
        privacyPolicyContent.value = data["data"]["content"] ?? "No content available";
      } else {
        errorMessage.value = "Failed to fetch privacy policy.";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
