// ignore_for_file: unused_local_variable

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/course/controller/course_details_controller.dart';
import 'package:skill_grow/features/course/widget/course_info.dart';
import 'package:skill_grow/features/course/widget/toggle_widget.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> overviewItems = [
      {"title": "Last Update", "value": "11/2024", "icon": AppIcon.date},
      {"title": "Duration", "value": "1h 30m", "icon": AppIcon.duration},
      {"title": "Certificate", "value": "Yes", "icon": AppIcon.certificate},
      {"title": "Total Lectures", "value": "200", "icon": AppIcon.lecture},
      {"title": "Quizzes", "value": "20", "icon": AppIcon.quiz},
      {"title": "Language", "value": "English", "icon": AppIcon.language},
    ];
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());

    CourseDetalisController courseDetalisController =
        Get.put(CourseDetalisController());

    return Scaffold(
      body: ColorfulSafeArea(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Obx(() {
            if (courseDetalisController.isLoading.value) {
              return Center(
                child: Shimmer.fromColors(
                  baseColor: AppColors.nuralItemBackgroundColor,
                  highlightColor: AppColors.shimmerBackgroundColor,
                  child: SingleChildScrollView(
                    child: Column(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
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
                          text:
                              "Master Laravel 11 & PHP: From Beginner to Advanced",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
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
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
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
                        verticalGap(10.sp),
                        Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          children: [
                            Expanded(
                              child: Container(
                                height: 80.sp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                                child: Column(
                                  textDirection:
                                      multiLangualDataController.isLTR.value
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalText(
                                      text: "Price:",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      textDirection:
                                          multiLangualDataController.isLTR.value
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        GlobalText(
                                          text: r"$50",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        horizontalGap(5.sp),
                                        GlobalText(
                                          text: r"$100",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            horizontalGap(10.sp),
                            Expanded(
                              child: Bounceable(
                                onTap: () {},
                                child: Container(
                                  height: 40.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1.5.sp),
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                  child: Center(
                                    child: GlobalText(
                                        text: "Add to Cart",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            horizontalGap(10.sp),
                            Expanded(
                              child: Bounceable(
                                onTap: () {},
                                child: Container(
                                  height: 40.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                  child: Center(
                                    child: GlobalText(
                                        text: "Buy Now",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                       
                      ],
                    ),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
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
                    // child: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse('https://www.youtube.com/'))),
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text:
                        courseDetalisController.course.value!.title.toString(),
                    softWrap: true,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                  verticalGap(5.sp),
                  RichText(
                    text: TextSpan(
                      text: translatedText("Created by"),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.smallTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: " ",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: translatedText(courseDetalisController
                              .course.value!.instructor.name
                              .toString()),
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
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    children: [
                      CustomRatingBar(
                        rating:
                            courseDetalisController.course.value!.averageRating,
                        maxRating: 5,
                        iconSize: 15.sp,
                        filledColor: AppColors.primaryColor,
                        unfilledColor: AppColors.activeIconColor,
                      ),
                      horizontalGap(3.sp),
                      GlobalText(
                        text:
                            "(${courseDetalisController.course.value!.reviewsCount})",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.smallTextColor,
                        ),
                        softWrap: true,
                      ),
                      GlobalText(
                        text: " | ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.smallTextColor,
                        ),
                        softWrap: true,
                      ),
                      GlobalText(
                        text:
                            "${courseDetalisController.course.value!.students}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.smallTextColor,
                        ),
                        softWrap: true,
                      ),
                      GlobalText(
                        text: " ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.smallTextColor,
                        ),
                        softWrap: true,
                      ),
                      GlobalText(
                        text: "Students",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.smallTextColor,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                  verticalGap(15.sp),
                  CourseInfo(courseDetalisController: courseDetalisController),
                  verticalGap(15.sp),
                  Row(
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    children: [
                      Expanded(
                        child: Container(
                          height: 80.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Column(
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: translatedText("Price"),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.smallTextColor,
                                      ),
                                      children: [
                                    TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ])),
                              Wrap(
                                textDirection:
                                    multiLangualDataController.isLTR.value
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  FittedBox(
                                    child: Flexible(
                                      child: GlobalText(
                                        text: courseDetalisController
                                            .course.value!.price,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  horizontalGap(5.sp),
                                  Flexible(
                                    child: FittedBox(
                                      child: GlobalText(
                                        text: courseDetalisController
                                            .course.value!.discount,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(10.sp),
                      Expanded(
                        child: Bounceable(
                          onTap: () {},
                          child: Container(
                            height: 40.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1.5.sp),
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Center(
                              child: GlobalText(
                                  text: "Add to Cart",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      horizontalGap(10.sp),
                      Expanded(
                        child: Bounceable(
                          onTap: () {},
                          child: Container(
                            height: 40.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Center(
                              child: GlobalText(
                                  text: "Buy Now",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ToggleWidget(courseDetalisController: courseDetalisController,),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
