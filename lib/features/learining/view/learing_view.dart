import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/learining/controller/enrolled_course_controller.dart';
import 'package:skill_grow/features/learining/widget/ernrollerd_course_loaing_ui.dart';
import 'package:skill_grow/features/video/view/landing_view.dart';
import '../../../core/colors/app_colors.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class LearingView extends StatelessWidget {
  LearingView({super.key});

  final ScrollController _scrollController =
      ScrollController(); // Added ScrollController

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    EnrolledCourseController enrolledCourseController =
        Get.put(EnrolledCourseController());

    // Listen for scrolling
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load next page only if there is more data
        if (enrolledCourseController.isMoreDataAvailable.value) {
          enrolledCourseController
              .fetchData(enrolledCourseController.currentPage.value);
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: ColorfulSafeArea(
          color: AppColors.scaffoldBackgroundColor,
          child: Obx(() {
            if (enrolledCourseController.isLoading.value &&
                enrolledCourseController.courses.isEmpty) {
              return ErnrollerdCourseLoaingUi();
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCustomAppBar(
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        isShowbackButton: false),
                    GlobalText(
                      text: "My Learnings",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller:
                            _scrollController, // Attach the scroll controller
                        itemCount: enrolledCourseController.courses.length +
                            1, // Add an extra item for the loader
                        itemBuilder: (context, index) {
                          if (index ==
                              enrolledCourseController.courses.length) {
                            // Show the circular progress indicator only if loading more data
                            return enrolledCourseController.isLoading.value
                                ? Center(child: CircularProgressIndicator())
                                : SizedBox.shrink(); // Hide if no more data
                          }

                          var data = enrolledCourseController.courses[index];

                          return Bounceable(
                            onTap: () {
                              Get.to(() => LandingViewForVideo(slug: data.slug,));
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                color: AppColors.nuralItemBackgroundColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: Row(
                                  textDirection:
                                      multiLangualDataController.isLTR.value
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  children: [
                                    Container(
                                      constraints:
                                          BoxConstraints(minHeight: 40.sp),
                                      width: 103.sp,
                                      child: Image.network(
                                        ApiEndpoint.imageUrl + data.thumbnail,
                                      ),
                                    ),
                                    horizontalGap(10.sp),
                                    SizedBox(
                                      width: 235.w,
                                      child: Column(
                                        textDirection:
                                            multiLangualDataController
                                                    .isLTR.value
                                                ? TextDirection.ltr
                                                : TextDirection.rtl,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GlobalText(
                                            text: data.title,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    AppColors.titleTextColor),
                                            softWrap: true,
                                          ),
                                          verticalGap(3.sp),
                                          Row(
                                            children: [
                                              GlobalText(
                                                  text: data.instructor.name,
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .titleTextColor),
                                                  softWrap: true),
                                              horizontalGap(5.sp),
                                              GlobalText(
                                                  text: '|',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .titleTextColor),
                                                  softWrap: true),
                                              horizontalGap(5.sp),
                                              GlobalText(
                                                  text:
                                                      data.students.toString(),
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .titleTextColor),
                                                  softWrap: true),
                                              horizontalGap(5.sp),
                                              GlobalText(
                                                  text: 'Students',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .titleTextColor),
                                                  softWrap: true),
                                            ],
                                          ),
                                          verticalGap(2.sp),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 170.w,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  child:
                                                      LinearProgressIndicator(
                                                    minHeight: 10.sp,
                                                    value: data.progress
                                                            .toDouble() /
                                                        10,
                                                    color:
                                                        AppColors.primaryColor,
                                                    backgroundColor:
                                                        Colors.grey.shade200,
                                                  ),
                                                ),
                                              ),
                                              horizontalGap(10.sp),
                                              GlobalText(
                                                text:
                                                    '${data.progress.toInt() * 10}/100',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors
                                                        .titleTextColor),
                                                softWrap: true,
                                              ),
                                              horizontalGap(5.sp),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
