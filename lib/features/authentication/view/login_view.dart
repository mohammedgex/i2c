import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/authentication/view/registration_view.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final formKey =
        GlobalKey<FormState>(); // Add a GlobalKey to handle validation

    return Scaffold(
      body: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Form(
              key: formKey, // Wrap the form fields in a Form widget
              child: Column(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.logo,
                    height: 100.sp,
                    width: 150.sp,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    hint: "Email",
                    keyName: "Email",
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Regex to check valid email format (optional)
                      String pattern =
                          r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b';
                      RegExp regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Valid email
                    },
                  ),
                  verticalGap(10.sp),
                  CustomTextField(
                    controller: TextEditingController(),
                    obscureText: true,
                    hint: "Password",
                    keyName: "Password",
                    inputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null; // Valid password
                    },
                  ),
                  verticalGap(10.sp),
                  GlobalButton(
                    width: double.infinity,
                    height: 50.sp,
                    text: "Login",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // If the form is valid, proceed with login
                      }
                    },
                  ),
                  verticalGap(5.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: "Don't have an account?",
                        softWrap: true,
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all<Color>(
                            AppColors.primaryColor,
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationView(),
                              ));
                        },
                        child: GlobalText(
                          text: "SignUp",
                          softWrap: true,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
