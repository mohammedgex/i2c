import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/texts.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class SearchDetalsView extends StatelessWidget {
  const SearchDetalsView({super.key});

  @override
  Widget build(BuildContext context) {  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    return Scaffold(
      body: ColorfulSafeArea(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
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
                    padding: EdgeInsets.all(3.sp),
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
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
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
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
                                textDirection:
                                    multiLangualDataController.isLTR.value
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                children: [
                                  CustomRatingBar(
                                    rating: 3.5,
                                    maxRating: 5,
                                    iconSize: 15.sp,
                                    filledColor: AppColors.activeIconColor,
                                    unfilledColor: AppColors.activeIconColor,
                                  ),
                                  Spacer(),
                                  Row(
                                    textDirection:
                                        multiLangualDataController.isLTR.value
                                            ? TextDirection.ltr
                                            : TextDirection.rtl,
                                    children: [
                                      GlobalText(
                                        text: '100',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.titleTextColor),
                                        softWrap: true,
                                      ),
                                      horizontalGap(3.sp),
                                      GlobalText(
                                        text: r'$50',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.titleTextColor),
                                        softWrap: true,
                                      ),
                                      horizontalGap(5.sp),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
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
