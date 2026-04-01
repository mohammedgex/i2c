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

          // Force RTL for onboarding page and use Arabic labels
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
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
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: AppColors.primaryGradient,
                            ).createShader(bounds),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.3,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          verticalGap(16.h),
                          Text(
                            item.description,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.smallTextColor,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
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
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: controller.currentPage.value == index ? 24.w : 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.h),
                        gradient: controller.currentPage.value == index
                            ? LinearGradient(
                                colors: AppColors.primaryGradient,
                              )
                            : null,
                        color: controller.currentPage.value == index
                            ? null
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                verticalGap(20.h),

                // Navigation Buttons
                Row(
                  // ensure buttons layout matches RTL
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: controller.currentPage.value > 0,
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.cardBackgroundColor,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: AppColors.textFieldBorderColor,
                              width: 1.5,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: controller.previousPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.h, horizontal: 30.w),
                            ),
                            child: Text(
                              "السابق",
                              style: TextStyle(
                                fontFamily: 'balooBhaijaan2',
                                fontSize: 16.sp,
                                color: AppColors.titleTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppColors.primaryGradient,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.4),
                              blurRadius: 12.r,
                              offset: Offset(0, 6.r),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: controller.nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 14.h, horizontal: 30.w),
                          ),
                          child: Obx(() {
                            return Text(
                              controller.currentPage.value ==
                                      controller
                                              .welcomeData.value!.data.length -
                                          1
                                  ? "ابدأ الآن"
                                  : "التالي",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'balooBhaijaan2',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalGap(30.h),
              ],
            ), // end Column
          ); // end Directionality (returned)
        }),
      ),
    );
  }
}
