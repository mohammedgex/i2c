import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';
import '../controller/update_bio_controller.dart';

class BioUpdateScreen extends StatelessWidget {
  const BioUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateBioController updateBioController = Get.put(UpdateBioController());

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
                    text: "Update Bio",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Job Title",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateBioController.jobTitleController,
                    hint: "Job Title",
                    inputType: TextInputType.text,
                    keyName: "Job Title",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Short Bio",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateBioController.shortBioController,
                    hint: "Short Bio",
                    inputType: TextInputType.emailAddress,
                    keyName: "Short Bio",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Bio",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateBioController.bioController,
                    hint: "Bio",
                    inputType: TextInputType.emailAddress,
                    keyName: "Bio",
                    maxLines: 10,
                    minLines: 5,
                  ),
                  verticalGap(20.sp),
                  Obx(() {
                    if (updateBioController.isLoading.value) {
                      return SizedBox(
                        height: 50.sp,
                        width: double.infinity,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else { return GlobalButton(
                      height: 50.sp,
                      width: double.infinity,
                      text: "Save",
                      onTap: () {
                        updateBioController.updateBio();
                      },
                    );}
                   
                  })
                ],
              ),
            ),
          )),
    );
  }
}
