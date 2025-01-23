import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';

import '../../../core/Global/api_service.dart';


class TermsAndConditionController extends GetxController {
  var isLoading = false.obs;
  var termsAndConditions = "".obs;
  var errorMessage = "".obs;


  @override
  void onInit() {
    super.onInit();
    fetchTermsAndConditions();
  }

  // Method to fetch privacy policy
  Future<void> fetchTermsAndConditions() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      ApiService apiService = ApiService();
      String url = ApiEndpoint.termsAndConditionsUrl(languageCode: "en"); // Replace with your API URL

      dio.Response? response = await apiService.getData(url: url, requiresAuth: false);

      if (response != null && response.statusCode == 200) {
        var data = response.data;
        termsAndConditions.value = data["data"]["content"] ?? "No content available";
      } else {
        errorMessage.value = "Failed to fetch terms and conditions.";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
