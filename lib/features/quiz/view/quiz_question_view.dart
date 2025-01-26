import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/quiz/widgets/question_view.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../controller/state_controller.dart';
import '../controller/question_data_get_controller.dart';

class QuizQuestionView extends StatelessWidget {
  const QuizQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizQuestionDataController quizQuestionDataController =
        Get.put(QuizQuestionDataController());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final CountdownController countdownController =
        Get.put(CountdownController());
    return Scaffold(
      body: Obx(() {
        if (quizQuestionDataController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          var data = quizQuestionDataController.quizData.value!.data;
          countdownController.setTimeFromMinutes(data.quiz.time);
          return ColorfulSafeArea(
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
                    text: data.quiz.title,
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
                            textDirection:
                                multiLangualDataController.isLTR.value
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
                                    Text(
                                      softWrap: true,
                                      data.quiz.passMark.toString(),
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
                                    Text(
                                      softWrap: true,
                                      data.quiz.totalMark.toString(),
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
                            textDirection:
                                multiLangualDataController.isLTR.value
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
                                    Text(
                                      softWrap: true,
                                      data.attempt.toString(),
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
                                    Text(
                                      softWrap: true,
                                      data.quiz.attempt.toString(),
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
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                softWrap: true,
                                data.quiz.totalQuestions.toString(),
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
                            textDirection:
                                multiLangualDataController.isLTR.value
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
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    width: double.infinity,
                    height: 100.sp,
                    decoration: BoxDecoration(
                      color: AppColors.infoSnackBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Center(
                        child: Row(
                      spacing: 20.sp,
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(7.sp),
                            height: 30.sp,
                            width: 30.sp,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              AppIcon.infoIcon,
                            )),
                        Expanded(
                          child: Column(
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalText(
                                softWrap: true,
                                text: "Please Note",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titleTextColor,
                                  height: 16.sp / 15.sp,
                                ),
                              ),
                              verticalGap(5.sp),
                              GlobalText(
                                softWrap: true,
                                text:
                                    "Form will be auto submitted when time runs out!",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onboardingSubtitleTextColor,
                                  height: 16.sp / 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Bounceable(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.all(3.sp),
                              height: 22.sp,
                              width: 22.sp,
                              child: SvgPicture.asset(
                                AppIcon.crossIcon,
                                color: Colors.grey,
                              )),
                        ),
                      ],
                    )),
                  ),
                  verticalGap(10.sp),
                  QuestionView(),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
