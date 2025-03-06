import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/quiz/controller/question_data_get_controller.dart';
import 'package:skill_grow/features/quiz/model/quiz_result_model.dart';
import 'package:skill_grow/features/quiz/widgets/circle_checkbox.dart';

class SubmittedAnswersView extends StatelessWidget {
  final QuizResult quizResult;

  const SubmittedAnswersView({super.key, required this.quizResult});

  @override
  Widget build(BuildContext context) {
    final MultiLangualDataController multiLangualDataController =
        Get.find<MultiLangualDataController>();
    final QuizQuestionDataController quizQuestionDataController =
        Get.find<QuizQuestionDataController>();

    return Scaffold(
      body: ColorfulSafeArea(
        child: Column(
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          children: [
            MyCustomAppBar(
              verticalPadding: 0,
              horizontalPadding: 10.sp,
              isShowbackButton: true,
            ),
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobalText(
                    text: 'Quiz Result',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Spacer(),
                  GlobalText(
                    text: 'Marks: ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                  GlobalText(
                    text: quizResult.data.userGrade.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.sp),
                itemCount: quizQuestionDataController
                    .quizData.value!.data.quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quizQuestionDataController
                      .quizData.value!.data.quiz.questions[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.sp),
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              text: "${index + 1}. ",
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.titleTextColor,
                              ),
                            ),
                            Expanded(
                              child: GlobalText(
                                text: question.title,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.titleTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalGap(10.sp),
                        ...question.answers.map((ans) {
                          Color borderColor =
                              AppColors.failedSnackIconBackgroundColor;
                          if (ans.isCorrect) {
                            borderColor =
                                AppColors.successSnackIconBackgroundColor;
                          }
                          return Container(
                            margin: EdgeInsets.only(bottom: 10.sp),
                            width: double.infinity,
                            padding: EdgeInsets.all(11.sp),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 2.sp),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomCircleCheckbox(
                                  questionId: question.id,
                                  answerId: ans.id,
                                ),
                                horizontalGap(10.sp),
                                Expanded(
                                  child: GlobalText(
                                    text: ans.title,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.titleTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
