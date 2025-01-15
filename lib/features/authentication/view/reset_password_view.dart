import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/authentication/controller/reset_password_controller.dart';
import 'package:skill_grow/widgets/text_input.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController =
        Get.put(ResetPasswordController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
        child: Form(
          key: resetPasswordController.formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.logo, height: 100.sp, width: 150.sp),
                CustomTextField(
                  controller:
                      resetPasswordController.forgetPasswordTokenController,
                  hint: "Forget Password Token",
                  inputType: TextInputType.text,
                  keyName: "forgetPasswordToken",
                  validator: (value) =>
                      resetPasswordController.validateToken(value),
                ),
                verticalGap(10.sp),
                CustomTextField(
                  controller: resetPasswordController.emailController,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                  keyName: "email",
                  validator: (value) =>
                      resetPasswordController.validateEmail(value),
                ),
                verticalGap(10.sp),
                CustomTextField(
                  controller: resetPasswordController.passwordController,
                  hint: "Password",
                  inputType: TextInputType.visiblePassword,
                  keyName: "password",
                  obscureText: true,
                  validator: (value) =>
                      resetPasswordController.validatePassword(value),
                ),
                verticalGap(10.sp),
                CustomTextField(
                  controller: resetPasswordController.confirmPasswordController,
                  hint: "Confirm Password",
                  inputType: TextInputType.visiblePassword,
                  keyName: "confirmPassword",
                  obscureText: true,
                  validator: (value) =>
                      resetPasswordController.validateConfirmPassword(value),
                ),
                verticalGap(10.sp),
                Obx(() {
                  if (resetPasswordController.isLoading.value) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(7.sp),
                        height: 50.sp,
                        width: 50.sp,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );
                  }
                  return GlobalButton(
                      height: 50.sp,
                      width: double.infinity,
                      text: "Send",
                      onTap: () {
                        if (resetPasswordController.formKey.currentState!
                            .validate()) {
                          resetPasswordController.resetPassword();
                        }
                      });
                }),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: GlobalText(
                    text: "Back",
                    softWrap: true,
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
