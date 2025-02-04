import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';

class UpdateSocialLinkScreen extends StatelessWidget {
  const UpdateSocialLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController facebookController = TextEditingController();
    TextEditingController twitterController = TextEditingController();
    TextEditingController linkedinController = TextEditingController();
    TextEditingController websiteController = TextEditingController();
    TextEditingController githubController = TextEditingController();

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
                    text: "Update Social Links",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Facebook",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: facebookController,
                    hint: "Facebook",
                    inputType: TextInputType.text,
                    keyName: "Facebook",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Twitter",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: twitterController,
                    hint: "Twitter",
                    inputType: TextInputType.text,
                    keyName: "CiTwitterty",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Linkedin",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: linkedinController,
                    hint: "Linkedin",
                    inputType: TextInputType.text,
                    keyName: "Linkedin",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Website",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: websiteController,
                    hint: "Website",
                    inputType: TextInputType.text,
                    keyName: "Website",
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Github",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: githubController,
                    hint: "Github",
                    inputType: TextInputType.text,
                    keyName: "Github",
                  ),
                  verticalGap(20.sp),
                  GlobalButton(
                    height: 50.sp,
                    width: double.infinity,
                    text: "Save",
                    onTap: () {},
                  )
                ],
              ),
            ),
          )),
    );
  }
}
