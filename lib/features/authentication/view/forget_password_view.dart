import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/widgets/text_input.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImage.logo, height: 100.sp, width: 150.sp),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Email",
                inputType: TextInputType.emailAddress,
                keyName: "email",
              ),
              verticalGap(10.sp),
              GlobalButton(
                  height: 50.sp,
                  width: double.infinity,
                  text: "Submit",
                  onTap: () {}),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: GlobalText(
                    text: "Back To Login",
                    softWrap: true,
                    style: TextStyle(color: AppColors.primaryColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
