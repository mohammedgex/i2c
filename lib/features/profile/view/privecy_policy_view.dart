import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/texts.dart';

import '../controller/privycy_policy_controller.dart';

class PrivecyPolicyView extends StatelessWidget {
  const PrivecyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    PrivacyPolicyController privacyPolicyController =
        Get.put(PrivacyPolicyController());
    return Scaffold(
      body: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: Obx(() {
          if (privacyPolicyController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlGlobalText(
                  text: privacyPolicyController.privacyPolicyContent.value,
                  softWrap: true,
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
