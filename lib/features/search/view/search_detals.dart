import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/appbar.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/texts.dart';

class SearchDetalsView extends StatelessWidget {
  const SearchDetalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                horizontalPadding: 0,
                verticalPadding: 0,
                isShowbackButton: true,
              ),
              // verticalGap(5.sp),
              GlobalText(
                text: 'Search Results',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
                softWrap: false,
              ),
              verticalGap(10.sp),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.sp),
                    color: AppColors.nuralItemBackgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Row(
                      children: [
                        Container(
                          height: 100.sp,
                          width: 150.sp,
                          decoration: BoxDecoration(),
                          child: Image.asset(AppImage.image1),
                        ),
                        horizontalGap(10.sp),
                        SizedBox(
                          child: Column(
                            children: [
                              GlobalText(
                                text:
                                    'Master Laravel 11 & PHP: From Beginner to Advanced',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.titleTextColor),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              verticalGap(5.sp),
                              GlobalText(
                                text:
                                    'Master Laravel 11 & PHP: From Beginner to Advanced',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.titleTextColor),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              verticalGap(5.sp),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              verticalGap(10.sp),
            ],
          ),
        ),
      ),
    );
  }
}
