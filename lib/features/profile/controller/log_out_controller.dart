import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/sharedPref.dart';
import '../../../core/Global/api_service.dart';

class LogOutController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = "".obs;

  // Method to fetch privacy policy
  Future<void> logOutFromThisDevice() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      ApiService apiService = ApiService();
      String url = ApiEndpoint.logoutUrl; // Replace with your API URL

      dio.Response? response =
          await apiService.postData(url: url, requiresAuth: true);

      if (response != null && response.statusCode == 200) {
        await SharedPrefUtil.clear();

        await Get.deleteAll(force: true); //deleting all controllers
        Phoenix.rebirth(Get.context!); // Restarting app
        Get.reset(); // resetting getx
      } else {
        errorMessage.value = "Failed to fetch privacy policy.";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logoutFromAllDevices() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      ApiService apiService = ApiService();
      String url =
          ApiEndpoint.logoutFromAllDevicesUrl; // Replace with your API URL

      dio.Response? response =
          await apiService.postData(url: url, requiresAuth: true);

      if (response != null && response.statusCode == 200) {
        await SharedPrefUtil.clear();

        await Get.deleteAll(force: true); //deleting all controllers
        Phoenix.rebirth(Get.context!); // Restarting app
        Get.reset(); // resetting getx
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
