import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/widgets/controller/checkbox_controller.dart';

class CustomRectangleCheckBox extends StatelessWidget {
  const CustomRectangleCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    CheckboxController controller = Get.put(CheckboxController());
    return Bounceable(
        onTap: () {
          controller.isSelected.value = !controller.isSelected.value;
        },
        child: Obx(() => Container(
              margin: EdgeInsets.all(5.sp),
              width: 20.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                color: controller.isSelected.value
                    ? AppColors.primaryColor
                    : Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.sp),
              ),
              child: Center(
                child: controller.isSelected.value
                    ? Icon(Icons.check, color: Colors.white, size: 18.sp)
                    : null,
              ),
            )));
  }
}
