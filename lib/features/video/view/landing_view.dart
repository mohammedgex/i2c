import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/controller/state_controller.dart';
import 'package:skill_grow/features/video/view/QNA_view.dart';
import 'package:skill_grow/features/video/view/curriculum_view.dart';

import '../../../core/constant/constant.dart';

class LandingViewForVideo extends StatelessWidget {
  const LandingViewForVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final ResourseToggleController controller =
        Get.put(ResourseToggleController());

    return Scaffold(
      body: ColorfulSafeArea(
        maintainBottomViewPadding: true,
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCustomAppBar(
                verticalPadding: 0,
                horizontalPadding: 0,
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
              verticalGap(5.sp),
              GlobalText(
                text: "Laravel: How To Work with Laravel?",
                softWrap: true,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              GlobalText(
                text: "Web Solution Us",
                softWrap: true,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor),
              ),
              verticalGap(7.sp),
              SizedBox(
                child: Obx(() {
                  return Container(
                    width: double.infinity,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(7.sp),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Bounceable(
                            onTap: () {
                              controller.selectedIndex(0);
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 0
                                      ? Colors.white
                                      : AppColors.nuralItemBackgroundColor,
                                  borderRadius: BorderRadius.circular(7.sp)),
                              child: Center(
                                child: GlobalText(
                                  text: "Curriculum",
                                  softWrap: false,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: controller.selectedIndex.value == 0
                                          ? AppColors.titleTextColor
                                          : AppColors.inactiveIconColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalGap(2.sp),
                        VerticalDivider(
                          thickness: 2.sp,
                          width: 3.sp,
                          endIndent: 15.sp,
                          indent: 15.sp,
                        ),
                        horizontalGap(2.sp),
                        Expanded(
                          child: Bounceable(
                            onTap: () {
                              controller.selectedIndex(1);
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 1
                                      ? Colors.white
                                      : AppColors.nuralItemBackgroundColor,
                                  borderRadius: BorderRadius.circular(7.sp)),
                              child: Center(
                                child: GlobalText(
                                  text: "QNA",
                                  softWrap: false,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: controller.selectedIndex.value == 1
                                          ? AppColors.titleTextColor
                                          : AppColors.inactiveIconColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalGap(2.sp),
                        VerticalDivider(
                          thickness: 2.sp,
                          width: 3.sp,
                          endIndent: 15.sp,
                          indent: 15.sp,
                        ),
                        horizontalGap(2.sp),
                        Expanded(
                          child: Bounceable(
                            onTap: () {
                              controller.selectedIndex(2);
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 2
                                      ? Colors.white
                                      : AppColors.nuralItemBackgroundColor,
                                  borderRadius: BorderRadius.circular(7.sp)),
                              child: Center(
                                child: GlobalText(
                                  text: "More",
                                  softWrap: false,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: controller.selectedIndex.value == 2
                                          ? AppColors.titleTextColor
                                          : AppColors.inactiveIconColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              verticalGap(10.sp),
              Obx(() {
                if (controller.selectedIndex.value == 0) {
                  return Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: CurriculumView(),
                  ));
                } else if (controller.selectedIndex.value == 1) {
                  return Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: QNAView(),
                  ));
                } else {
                  return Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.mainRedColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
