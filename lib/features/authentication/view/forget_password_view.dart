import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/authentication/controller/forget_password_controller.dart';
import 'package:skill_grow/features/authentication/view/reset_password_view.dart';
import 'package:skill_grow/widgets/text_input.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController forgetPasswordController =
        Get.put(ForgetPasswordController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
        child: Form(
          key: forgetPasswordController.formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.logo, height: 100.sp, width: 150.sp),
                CustomTextField(
                  controller: forgetPasswordController.emailController,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                  keyName: "email",
                  validator: (value) =>
                      forgetPasswordController.validateEmail(value),
                ),
                verticalGap(10.sp),
                Obx(() {
                  if (forgetPasswordController.isLoading.value) {
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
                        if (forgetPasswordController.formKey.currentState!
                            .validate()) {
                          forgetPasswordController.forgetPassword();
                        }
                      });
                }),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordView()));
                  },
                  child: GlobalText(
                    text: "Back To Login",
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
