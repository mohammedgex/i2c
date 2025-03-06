import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/authentication/view/login_view.dart';

class ResetPasswordInfoView extends StatelessWidget {
  const ResetPasswordInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GlobalText(
                text: "Check your email to reset your password !",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold, // Added bold style for emphasis
                ),
                textAlign: TextAlign.center, // Center text alignment
              ),
              verticalGap(20.sp), // Increased gap for better spacing
              GlobalButton(
                height: 50.h, // Responsive height
                width: 320.w, // Responsive width
                text: "Back to login",
                onTap: () {
                  Get.offAll(() => LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
