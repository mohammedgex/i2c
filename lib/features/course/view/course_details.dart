import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/core/widgets/wrapper_with_max_line.dart';
import 'package:skill_grow/features/course/widget/overview_item.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                horizontalPadding: 0,
                verticalPadding: 0,
                isShowbackButton: true,
              ),
              verticalGap(10.sp),
              Container(
                width: double.infinity,
                height: 200.sp,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              verticalGap(10.sp),
              GlobalText(
                text: "Master Laravel 11 & PHP: From Beginner to Advanced",
                softWrap: true,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
              verticalGap(5.sp),
              RichText(
                text: TextSpan(
                  text: "Created by ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.smallTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Web Solution US",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              verticalGap(7.sp),
              Row(
                children: [
                  CustomRatingBar(
                    rating: 2.5,
                    maxRating: 5,
                    iconSize: 15.sp,
                    filledColor: AppColors.primaryColor,
                    unfilledColor: AppColors.activeIconColor,
                  ),
                  horizontalGap(3.sp),
                  GlobalText(
                    text: "(500) | 200 Students",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.smallTextColor,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
              verticalGap(5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OverviewItem(),
                  OverviewItem(),
                ],
              ),
              verticalGap(10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OverviewItem(),
                  OverviewItem(),
                ],
              ),
              verticalGap(10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OverviewItem(),
                  OverviewItem(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
