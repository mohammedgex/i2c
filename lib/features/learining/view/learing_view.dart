import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/images/app_image.dart';

class LearingView extends StatelessWidget {
  const LearingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                verticalPadding: 0,
                horizontalPadding: 0,
                isShowbackButton: true,
              ),
              GlobalText(
                text: "My Learnings",
                softWrap: true,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.sp),
                    color: AppColors.nuralItemBackgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3.sp),
                    child: Row(
                      children: [
                        Container(
                          height: 80.sp,
                          width: 103.sp,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            AppImage.image1,
                            // fit: BoxFit.cover,
                          ),
                        ),
                        horizontalGap(10.sp),
                        SizedBox(
                          width: 235.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalText(
                                text:
                                    'Master Laravel 11 & PHP: From Beginner to Advanced',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.titleTextColor),
                                softWrap: true,
                              ),
                              verticalGap(3.sp),
                              GlobalText(
                                  text: 'Web Solution Us | 1000+ Students',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.titleTextColor),
                                  softWrap: true),
                              verticalGap(2.sp),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 170.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      child: LinearProgressIndicator(
                                        minHeight: 10.sp,
                                        value: 0.7,
                                        color: AppColors.primaryColor,
                                        backgroundColor: Colors.grey.shade200,
                                      ),
                                    ),
                                  ),
                                  horizontalGap(10.sp),
                                  GlobalText(
                                    text: r'70/100',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.titleTextColor),
                                    softWrap: true,
                                  ),
                                  horizontalGap(5.sp)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
