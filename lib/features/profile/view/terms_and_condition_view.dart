import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/profile/controller/terms_and_condition_controller.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    TermsAndConditionController privacyPolicyController =
        Get.put(TermsAndConditionController());
    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        color: AppColors.scaffoldBackgroundColor,
        child: Obx(() {
          if (privacyPolicyController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MyCustomAppBar(
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      isShowbackButton: true,
                    ),
                    GlobalText(
                      text: "Terms & Conditions",
                      softWrap: true,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                    HtmlGlobalText(
                      text: privacyPolicyController.termsAndConditions.value,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
