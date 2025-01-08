import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/features/course/controller/toggle_controller.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/texts.dart';

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ToggleController toggleController = ToggleController();
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50.sp, // Adjust as needed
          decoration: BoxDecoration(
            color: AppColors.nuralItemBackgroundColor,
            borderRadius: BorderRadius.circular(3.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
            child: Row(
              children: [
                Expanded(
                  child: Bounceable(
                    onTap: () {
                      toggleController.selectedIndex(0);
                    },
                    child: Obx(() {
                      return Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.grey, width: 1.5.sp)),
                          color: toggleController.selectedIndex.value == 0
                              ? Colors.white
                              : null,
                        ),
                        child: Center(
                          child: GlobalText(
                            text: "Overview",
                            softWrap: true,
                            style: TextStyle(
                                color: AppColors.smallTextColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                horizontalGap(5.sp),
                Expanded(
                  child: Bounceable(
                    onTap: () {
                      toggleController.selectedIndex(1);
                    },
                    child: Obx(() {
                      return Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            right:
                                BorderSide(color: Colors.grey, width: 1.5.sp),
                          ),
                          color: toggleController.selectedIndex.value == 1
                              ? Colors.white
                              : null,
                        ),
                        child: Center(
                          child: GlobalText(
                            text: "Curriculum",
                            softWrap: true,
                            style: TextStyle(
                                color: AppColors.smallTextColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Bounceable(
                    onTap: () {
                      toggleController.selectedIndex(2);
                    },
                    child: Obx(() {
                      return Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white, width: 1.5.sp),
                          borderRadius: BorderRadius.circular(3.sp),
                          color: toggleController.selectedIndex.value == 2
                              ? Colors.white
                              : null,
                        ),
                        child: Center(
                          child: GlobalText(
                            text: "Reviews",
                            softWrap: true,
                            style: TextStyle(
                                color: AppColors.smallTextColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          if (toggleController.selectedIndex.value == 0) {
            return Container(
              width: double.infinity,
              // height: 100.sp,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      text: "Description",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalGap(10.sp),
                    GlobalText(
                      text:
                          r"Are you ready to take your Laravel skills to the next level? In this course, you will build a complete Realtime Messaging System project from scratch using Laravel 10 and Pusher. This project-based  course is designed to help you become a professional Laravel developer and give you a competitive edge in the job market.Why Learn Laravel 10?Laravel 10 is the latest version of the popular PHP framework and  comes packed with new features and improvements, making it faster and  more efficient than ever before. It's easy to learn and has a huge  community, making it the perfect choice for building robust and scalable web applications.What Will You Learn?",
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            );
          } else if (toggleController.selectedIndex.value == 1) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 7.sp, vertical: 15.sp),
                child: Accordion(
                  disableScrolling: true,
                  contentVerticalPadding: 0,
                  paddingListTop: 0,
                  paddingListBottom: 0,
                  rightIcon: SvgPicture.asset(
                    AppIcon.arrowDownIcon,
                    color: Colors.black,
                  ),
                  children: [
                    AccordionSection(
                      headerPadding: EdgeInsets.all(10.sp),
                      headerBackgroundColor: AppColors.nuralItemBackgroundColor,
                      contentBackgroundColor:
                          AppColors.nuralItemBackgroundColor,
                      contentBorderColor: Colors.transparent,
                      header: GlobalText(
                        text: "Introduction",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.titleTextColor),
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.sp,
                            child: ListTile(
                                title: GlobalText(
                                  text: "How To Work With Laravel",
                                  softWrap: true,
                                ),
                                subtitle: GlobalText(
                                  text: "1h 30m",
                                  softWrap: true,
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                trailing: SvgPicture.asset(
                                  AppIcon.playIcon,
                                  color: AppColors.activeIconColor,
                                )),
                          ),
                          SizedBox(
                            height: 50.sp,
                            child: ListTile(
                                title: GlobalText(
                                  text: "Environment Setup For Laravel",
                                  softWrap: true,
                                ),
                                subtitle: GlobalText(
                                  text: "1h 30m",
                                  softWrap: true,
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                trailing: SvgPicture.asset(
                                  AppIcon.lockIcon,
                                  color: AppColors.activeIconColor,
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              // height: 100.sp,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 30.r,
                              backgroundImage:
                                  AssetImage(AppImage.freshCourseImage1)),
                          horizontalGap(10.sp),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  text: "Shakil Ahmed",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CustomRatingBar(
                                  rating: 3.5,
                                  filledColor: AppColors.activeIconColor,
                                  unfilledColor: AppColors.activeIconColor,
                                  iconSize: 15.sp,
                                ),
                                GlobalText(
                                  text:
                                      "A simple yet profound tale, The Alchemist inspires readers to follow their dreams. Its universal themes of purpose and self-discovery resonate deeply. A poetic reminder to listen to one’s heart.",
                                  softWrap: true,
                                  style: TextStyle(fontSize: 12.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        })
      ],
    );
  }
}
