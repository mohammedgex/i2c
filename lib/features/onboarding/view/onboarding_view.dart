import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/features/onboarding/controller/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.find<OnboardingController>();

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                  itemCount: controller.welcomeData.value!.data.length,
                  itemBuilder: (context, index) {
                    final item = controller.welcomeData.value!.data[index];

                    // Loop through images dynamically
                    List<String> onboardingImages = [
                      AppImage.onboardingImage1,
                      AppImage.onboardingImage2,
                      AppImage.onboardingImage3
                    ];
                    String image =
                        onboardingImages[index % onboardingImages.length];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Center(
                          child: Image.asset(
                            image,
                            height: 250.h,
                          ),
                        ),
                        verticalGap(30.h),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        verticalGap(10.h),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              verticalGap(100.h),

              // Page Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.welcomeData.value!.data.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    width: controller.currentPage.value == index ? 12.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentPage.value == index
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              verticalGap(20.h),

              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: controller.currentPage.value > 0,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: controller.previousPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 30.w),
                        ),
                        child: Text(
                          "Previous",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    if (controller.currentPage.value > 0) {
                      return horizontalGap(20.w);
                    } else {
                      return SizedBox();
                    }
                  }),
                  Expanded(
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: controller.nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 30.w),
                        ),
                        child: Obx(() {
                          return Text(
                            controller.currentPage.value ==
                                    controller.welcomeData.value!.data.length -
                                        1
                                ? "Get Started"
                                : "Next",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              verticalGap(30.h),
            ],
          );
        }),
      ),
    );
  }
}
