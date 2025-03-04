import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/features/profile/controller/update_profile_controller.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateProfileController updateProfileController =
        Get.put(UpdateProfileController());

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
                    text: "Update Profile",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Name",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateProfileController.nameController,
                    hint: "Name",
                    inputType: TextInputType.text,
                    keyName: "name",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Email",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateProfileController.emailController,
                    hint: "Email",
                    inputType: TextInputType.emailAddress,
                    keyName: "Email",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Phone Number",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateProfileController.phoneController,
                    hint: "Phone Number",
                    inputType: TextInputType.emailAddress,
                    keyName: "Phone Number",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Age",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateProfileController.ageController,
                    hint: "Age",
                    inputType: TextInputType.emailAddress,
                    keyName: "Age",
                  ),
                  verticalGap(20.sp),
                   Obx(
                    () {
                      if (updateProfileController.isLoading.value) {
                        return SizedBox(
                          height: 50.sp,
                          width: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return GlobalButton(
                          height: 50.sp,
                          width: double.infinity,
                          text: "Save",
                          onTap: () {
                            updateProfileController.updateProflie();
                          },
                        );
                      }
                    },
                  ),
                 
                ],
              ),
            ),
          )),
    );
  }
}
