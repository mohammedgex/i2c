// ignore_for_file: unused_local_variable

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/controller/announcement_controller.dart';
import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class AnnouncementsView extends StatelessWidget {
  String slug;
  AnnouncementsView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    AnnouncementController announcementController =
        Get.put(AnnouncementController(slug));
    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        color: AppColors.scaffoldBackgroundColor,
        child: Obx(() {
          if (announcementController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (announcementController.announcements.value == null) {
              return Column(
                children: [
                  MyCustomAppBar(
                    verticalPadding: 0,
                    horizontalPadding: 10.sp,
                    isShowbackButton: true,
                  ),
                  Spacer(),
                  GlobalText(
                    text: "No data found",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                ],
              );
            }
            return Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCustomAppBar(
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    isShowbackButton: true,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Announcements",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalGap(10.sp),
                  Expanded(
                    child: ListView.builder(
                      itemCount: announcementController
                          .announcements.value!.data.length,
                      itemBuilder: (context, index) {
                        final announcement = announcementController
                            .announcements.value!.data[index];
                        return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              color: AppColors.nuralItemBackgroundColor,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Column(
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  textDirection:
                                      multiLangualDataController.isLTR.value
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.sp,
                                      backgroundImage: NetworkImage(
                                        ApiEndpoint.BASE_URL +
                                            announcement.instructor.image,
                                      ),
                                    ),
                                    horizontalGap(15.sp),
                                    Column(
                                      textDirection:
                                          multiLangualDataController.isLTR.value
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GlobalText(
                                          text: announcement.instructor.name,
                                          style: TextStyle(
                                            color: AppColors.titleTextColor,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          softWrap: true,
                                        ),
                                        GlobalText(
                                          text: announcement.createdAt,
                                          style: TextStyle(
                                            color: AppColors.titleTextColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                verticalGap(10.sp),
                                GlobalText(
                                  text: announcement.title,
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  softWrap: true,
                                ),
                                HtmlGlobalText(
                                  text: announcement.announcement,
                                  softWrap: true,
                                  style: TextStyle(
                                    color: AppColors.smallTextColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
