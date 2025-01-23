import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../controller/countdown_controller.dart';

class QuizQuestionView extends StatelessWidget {
  const QuizQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final CountdownController countdownController =
        Get.put(CountdownController());
    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                verticalPadding: 0,
                horizontalPadding: 0,
                isShowbackButton: true,
              ),
              verticalGap(5.sp),
              GlobalText(
                softWrap: true,
                text: "Quizs",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
              ),
              verticalGap(10.sp),
              Row(
                spacing: 5.sp,
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 70.sp,
                      decoration: BoxDecoration(
                        color: AppColors.successSnackIconBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Column(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              children: [
                                GlobalText(
                                  softWrap: true,
                                  text: "50",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                GlobalText(
                                  softWrap: true,
                                  text: "/",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                GlobalText(
                                  softWrap: true,
                                  text: "100",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          GlobalText(
                            softWrap: true,
                            text: "Minimum Marks",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 10.sp / 10.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 70.sp,
                      decoration: BoxDecoration(
                        color: AppColors.infoSnackIconBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Column(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              children: [
                                GlobalText(
                                  softWrap: true,
                                  text: "00",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                GlobalText(
                                  softWrap: true,
                                  text: "/",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                GlobalText(
                                  softWrap: true,
                                  text: "50",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          GlobalText(
                            softWrap: true,
                            text: "Attemps",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 10.sp / 10.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 70.sp,
                      width: 100.sp,
                      decoration: BoxDecoration(
                        color: AppColors.warningSnackIconBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Column(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GlobalText(
                            softWrap: true,
                            text: "00",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          GlobalText(
                            softWrap: true,
                            text: "Questions",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 10.sp / 10.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 70.sp,
                      decoration: BoxDecoration(
                        color: AppColors.failedSnackIconBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Column(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Obx(() {
                              return GlobalText(
                                softWrap: true,
                                text:
                                    "${countdownController.hours.value.toString().padLeft(2, '0')}:"
                                    "${countdownController.minutes.value.toString().padLeft(2, '0')}:"
                                    "${countdownController.seconds.value.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              );
                            }),
                          ),
                          GlobalText(
                            softWrap: true,
                            text: "Reminded Time",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 10.sp / 10.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalGap(10.sp),
            ],
          ),
        ),
      ),
    );
  }
}
