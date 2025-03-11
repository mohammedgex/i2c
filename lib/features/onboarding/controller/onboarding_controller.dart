import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/sharedPref.dart';
import 'package:skill_grow/features/authentication/view/login_view.dart';
import 'package:skill_grow/features/onboarding/model/onboarding_model.dart';

class OnboardingController extends GetxController {
  final ApiService _apiService = ApiService();
  Rx<OnboardingModel?> welcomeData = Rx<OnboardingModel?>(null);
  RxBool isLoading = true.obs;
  RxInt currentPage = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    fetchOnboardingData();
    super.onInit();
  }

  void fetchOnboardingData() async {
    isLoading.value = true;
    dio.Response? response =
        await _apiService.getData(url: ApiEndpoint.onboardingUrl);

    if (response != null && response.statusCode == 200) {
      welcomeData.value = OnboardingModel.fromJson(response.data);
    }
    isLoading.value = false;
  }

  void nextPage() {
    if (currentPage.value < welcomeData.value!.data.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      SharedPrefUtil.put("isFirstTime", false);
      // Navigate to home or login screen
      Get.offAll(() => LoginView());
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
