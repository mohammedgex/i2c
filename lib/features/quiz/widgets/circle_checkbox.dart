import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/colors/app_colors.dart';
import '../controller/state_controller.dart';

class CustomCircleCheckbox extends StatelessWidget {
  final int questionId;
  final int answerId;

  const CustomCircleCheckbox({
    super.key,
    required this.questionId,
    required this.answerId,
  });

  @override
  Widget build(BuildContext context) {
    CheckBoxController checkboxController = Get.put(CheckBoxController());

    return Obx(() {
      bool isSelected =
          checkboxController.selectedAnswers[questionId] == answerId;

      return Container(
        width: 23.sp,
        height: 23.sp,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.nuralItemBackgroundColor,
          shape: BoxShape.circle,
          border: isSelected ? null : Border.all(color: Colors.grey),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 10.sp,
                  height: 10.sp,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null,
      );
    });
  }
}
