import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

import '../../../core/widgets/texts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    MyCustomAppBar(
                      horizontalPadding: 0,
                      verticalPadding: 0.sp,
                      isShowbackButton: false,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200.sp,
                      decoration: BoxDecoration(
                        // color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 120.sp,
                              height: 120.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.mainRedColor,
                                image: DecorationImage(
                                    image: AssetImage(AppImage.profile),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            verticalGap(5.sp),
                            GlobalText(
                              text: 'Meharab Islam',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                            GlobalText(
                              text: 'student@gmail.com',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w300),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalGap(20.sp),
                    GlobalText(text: "Language and Currency", softWrap: true),
                    verticalGap(10.sp),
                    Container(
                      width: double.infinity,
                      height: 50.sp,
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Row(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        children: [
                          horizontalGap(10.sp),
                          GlobalText(text: "Language", softWrap: true),
                          GlobalText(text: "(English)", softWrap: true),
                          horizontalGap(10.sp),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.mainRedColor,
                            size: 15.sp,
                          ),
                          horizontalGap(10.sp),
                        ],
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
