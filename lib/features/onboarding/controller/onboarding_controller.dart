import 'package:get/get.dart';

import 'package:skill_grow/features/navigation_bar/views/bottom_navigation_bar.dart';

import '../../../core/images/app_image.dart';

class OnboardingController extends GetxController {
  var currentPageIndex = 0.obs; // Track the current page index

  // List of onboarding data
  List<Map> onboardingData = [
    {
      "title": "Welcome to SkillGrow",
      "subtitle":
          "Unlock your potential and embark on a transformative learning journey with us.",
      "image": AppImage.onboardingImage1, // Replace with your actual image path
    },
    {
      "title": "Learn at Your Pace",
      "subtitle":
          "Access courses anytime, anywhere, and track your progress as you grow.",
      "image": AppImage.onboardingImage2, // Replace with your actual image path
    },
    {
      "title": "Showcase Your Skills",
      "subtitle":
          "Complete courses to earn certificates and take your career to new heights.",
      "image": AppImage.onboardingImage3, // Replace with your actual image path
    },
  ];

  // Method to go to the next page
  void goToNextPage() {
    if (currentPageIndex.value < onboardingData.length - 1) {
      currentPageIndex.value++;
    } else {
      // Navigate to HomeScreen
      Get.off(() => CustomPersistentBottomNavBar());
    }
  }
}
