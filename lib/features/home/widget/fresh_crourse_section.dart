// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/features/course/controller/fresh_course_conroller.dart';

import '../../../core/widgets/texts.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class FreshCrourseSection extends StatelessWidget {
  FreshCrourseSection({super.key});

  FreshCourseConroller freshCourseController = Get.put(FreshCourseConroller());

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
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
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
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
                            Row(
                                textDirection:
                                    multiLangualDataController.isLTR.value
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                children: [
                                  Container(
                                    height: 20.sp,
                                    width: 100.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.nuralItemBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                    ),
                                  ),
                                  horizontalGap(5.sp),
                                  Container(
                                    height: 20.sp,
                                    width: 50.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.nuralItemBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
              height: 220.sp,
              child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: freshCourseController.courses.length >= 4
                      ? 4
                      : freshCourseController.courses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200.sp,
                      margin: EdgeInsets.only(right: 15.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Column(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // height: 101.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Image.network(
                                ApiEndpoint.imageUrl +
                                    freshCourseController
                                        .courses[index].thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          verticalGap(3.sp),
                          GlobalText(
                            text: freshCourseController.courses[index].title
                                .toString(),
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
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              GlobalText(
                                text: freshCourseController
                                    .courses[index].instructor.name
                                    .toString(),
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
                                text: freshCourseController
                                    .courses[index].students
                                    .toString(),
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
                          Wrap(
                            spacing: 10.sp,
                            runSpacing: 1.sp,
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              CustomRatingBar(
                                rating: freshCourseController
                                    .courses[index].averageRating,
                                iconSize: 15.sp,
                                maxRating: 5,
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
                                      text: freshCourseController
                                          .courses[index].discount
                                          .toString(),
                                      style: TextStyle(
                                          color: AppColors.smallTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 11.sp / 9.sp,
                                          decoration:
                                              TextDecoration.lineThrough),
                                      softWrap: false,
                                    ),
                                    GlobalText(
                                      text: freshCourseController
                                          .courses[index].price
                                          .toString(),
                                      style: TextStyle(
                                        color: AppColors.smallTextColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 15.sp / 14.sp,
                                        // decoration: TextDecoration.lineThrough
                                      ),
                                      softWrap: false,
                                    ),
                                  ]),
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
