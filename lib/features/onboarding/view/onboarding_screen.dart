import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/features/onboarding/controller/onboarding_controller.dart';

import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart'; // Import the controller

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    // Initialize the GetX controller
    final OnboardingController onboardingController =
        Get.put(OnboardingController());

    return Scaffold(
      body: Obx(() {
        // Get the current page data based on the currentPageIndex
        var currentPageData = onboardingController
            .onboardingData[onboardingController.currentPageIndex.value];

        return SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(25.0.sp),
              child: Column(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),

                  // Display image for current page
                  SizedBox(
                    height: 296.sp,
                    width: 326.sp,
                    child: Image.asset(currentPageData[
                        "image"]), // Dynamically change the image based on current page
                  ),

                  verticalGap(50.sp),

                  // Page Indicators (dots) to show the current page
                  Row(
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8.sp,
                    children: List.generate(
                        onboardingController.onboardingData.length, (index) {
                      return Container(
                        height: 8.sp,
                        width: 8.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: onboardingController.currentPageIndex.value ==
                                  index
                              ? AppColors.primaryColor
                              : AppColors.inactiveIconColor,
                        ),
                      );
                    }),
                  ),

                  verticalGap(20.sp),

                  // Display title and subtitle for current page
                  Text(
                    currentPageData["title"] ?? "Default Title",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.black), // Adjust as necessary
                  ),
                  verticalGap(20.sp),
                  Text(
                    currentPageData["subtitle"] ?? "Default Subtitle",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black), // Adjust as necessary
                  ),

                  verticalGap(40.sp),

                  // "Next" or "Start" button based on the current page index
                  GlobalButton(
                    onTap: onboardingController.goToNextPage,
                    height: 48.sp,
                    width: double.infinity,
                    text: onboardingController.currentPageIndex.value ==
                            onboardingController.onboardingData.length - 1
                        ? "Start Learning"
                        : "Next",
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
