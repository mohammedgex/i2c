// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/features/home/controller/fresh_course_item_controller.dart';

import '../../../core/widgets/texts.dart';

class FreshCrourseSection extends StatelessWidget {
  FreshCrourseSection({super.key});

  FreshCourseItemController freshCourseController =
      Get.put(FreshCourseItemController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.sp),
      child: Obx(() {
        if (freshCourseController.isLoading.value) {
          return Shimmer.fromColors(
            baseColor: AppColors.nuralItemBackgroundColor,
            highlightColor: AppColors.shimmerBackgroundColor,
            child: SizedBox(
              height: 171.sp,
              child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.sp),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 101.sp,
                              width: 159.sp,
                              decoration: BoxDecoration(
                                color: AppColors.nuralItemBackgroundColor,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                            verticalGap(5.sp),
                            Container(
                              height: 8.sp,
                              width: 150.sp,
                              decoration: BoxDecoration(
                                color: AppColors.nuralItemBackgroundColor,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                            verticalGap(5.sp),
                            Container(
                              height: 8.sp,
                              width: 100.sp,
                              decoration: BoxDecoration(
                                color: AppColors.nuralItemBackgroundColor,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                            verticalGap(7.sp),
                            Container(
                              height: 8.sp,
                              width: 150.sp,
                              decoration: BoxDecoration(
                                color: AppColors.nuralItemBackgroundColor,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                            Spacer(),
                            Row(children: [
                              Container(
                                height: 20.sp,
                                width: 100.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.nuralItemBackgroundColor,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                              horizontalGap(5.sp),
                              Container(
                                height: 20.sp,
                                width: 50.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.nuralItemBackgroundColor,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                            ])
                          ]),
                    );
                  }),
            ),
          );
        } else {
          return SizedBox(
              height: 175.sp,
              child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: freshCourseController.freshCourses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 171.sp,
                      width: 180.sp,
                      margin: EdgeInsets.only(right: 15.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 101.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Image.asset(
                                freshCourseController.freshCourses[index]
                                    ["image"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          verticalGap(3.sp),
                          GlobalText(
                            text: freshCourseController.freshCourses[index]
                                ["title"],
                            style: TextStyle(
                              color: AppColors.titleTextColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 14.sp / 13.sp,
                            ),
                            softWrap: true,
                            maxLines: 2,
                          ),
                          verticalGap(5.sp),
                          Row(
                            children: [
                              GlobalText(
                                text: freshCourseController.freshCourses[index]
                                    ["author"],
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 11.sp / 9.sp,
                                ),
                                softWrap: false,
                              ),
                              horizontalGap(2.sp),
                              GlobalText(
                                text: "|",
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 11.sp / 9.sp,
                                ),
                                softWrap: false,
                              ),
                              horizontalGap(2.sp),
                              GlobalText(
                                text: freshCourseController.freshCourses[index]
                                    ["totalStudents"],
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 11.sp / 9.sp,
                                ),
                                softWrap: false,
                              ),
                              GlobalText(
                                text: "Students",
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 11.sp / 9.sp,
                                ),
                                softWrap: false,
                              ),
                            ],
                          ),
                          verticalGap(5.sp),
                          Row(
                            children: [
                              CustomRatingBar(
                                rating: 4.5,
                                iconSize: 15.sp,
                              ),
                              Spacer(),
                              GlobalText(
                                text: freshCourseController.freshCourses[index]
                                    ["previousPrice"],
                                style: TextStyle(
                                    color: AppColors.smallTextColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 11.sp / 9.sp,
                                    decoration: TextDecoration.lineThrough),
                                softWrap: false,
                              ),
                              GlobalText(
                                text: freshCourseController.freshCourses[index]
                                    ["currentPrice"],
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 15.sp / 14.sp,
                                  // decoration: TextDecoration.lineThrough
                                ),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }));
        }
      }),
    );
  }
}
