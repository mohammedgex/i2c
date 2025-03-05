import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/quiz/widgets/circle_checkbox.dart';

import '../controller/question_data_get_controller.dart';
import '../controller/state_controller.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final QuizQuestionDataController quizQuestionDataController =
        Get.find<QuizQuestionDataController>();
    CheckBoxController checkboxController = Get.put(CheckBoxController());
    return SingleChildScrollView(
      child: Column(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        children: List.generate(
            quizQuestionDataController
                .quizData.value!.data.quiz.questions.length, (index) {
          var data = quizQuestionDataController
              .quizData.value!.data.quiz.questions[index];
          return Container(
            margin: EdgeInsets.only(bottom: 10.sp),
            padding: EdgeInsets.all(15.sp),
            decoration:
                BoxDecoration(color: AppColors.nuralItemBackgroundColor),
            child: Column(
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
                        text: data.title,
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
                ...data.answers.map((ans) {
                  return InkWell(
                    onTap: () {
                      checkboxController.selectAnswer(data.id, ans.id, data.id);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.sp),
                      width: double.infinity,
                      padding: EdgeInsets.all(11.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCircleCheckbox(
                            questionId: data.id,
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
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
