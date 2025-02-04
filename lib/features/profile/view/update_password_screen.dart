import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/features/profile/controller/update_password_controller.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpdatePasswordController updatePasswordController =
        Get.put(UpdatePasswordController());

    return Scaffold(
      body: ColorfulSafeArea(
          color: AppColors.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCustomAppBar(
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    isShowbackButton: true,
                    isShowNotification: false,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Update Password",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Current Password",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller:
                        updatePasswordController.currentPasswordController,
                    hint: "Current Password",
                    inputType: TextInputType.visiblePassword,
                    keyName: "Current Password",
                    obscureText: true,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "New Password",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updatePasswordController.newPasswordController,
                    hint: "New Password",
                    inputType: TextInputType.visiblePassword,
                    keyName: "New Password",
                    obscureText: true,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Confirm Password",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    obscureText: true,
                    controller:
                        updatePasswordController.confirmPasswordController,
                    hint: "Confirm Password",
                    inputType: TextInputType.visiblePassword,
                    keyName: "Confirm Password",
                  ),
                  verticalGap(20.sp),
                  GlobalButton(
                    height: 50.sp,
                    width: double.infinity,
                    text: "Save",
                    onTap: () {
                      updatePasswordController.updatePassword();
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
