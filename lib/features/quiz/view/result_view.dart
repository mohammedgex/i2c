import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/quiz/controller/question_data_get_controller.dart';

class SubmittedAnswersView extends StatelessWidget {
  final Map<String, dynamic> resultData;

  const SubmittedAnswersView({super.key, required this.resultData});

  @override
  Widget build(BuildContext context) {
    final MultiLangualDataController multiLangualDataController =
        Get.find<MultiLangualDataController>();
    final QuizQuestionDataController quizQuestionDataController =
        Get.find<QuizQuestionDataController>();

    // Extract the result field
    final dynamic resultField = resultData['data']['result'];
    Map<String, dynamic> results = {};

    if (resultField is Map<String, dynamic>) {
      results = resultField; // Use directly if it's a Map
    } else if (resultField is String) {
      try {
        results = Map<String, dynamic>.from(
            jsonDecode(resultField)); // Parse if it's a String
      } catch (e) {
        print('Error parsing result: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted Answers'),
      ),
      body: SingleChildScrollView(
        child: Column(
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          children: [
            // Display overall status
            Container(
              padding: EdgeInsets.all(16.sp),
              margin: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: resultData['data']['status'] == 'passed'
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(
                    resultData['data']['status'] == 'passed'
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: resultData['data']['status'] == 'passed'
                        ? Colors.green
                        : Colors.red,
                  ),
                  horizontalGap(10.sp),
                  Expanded(
                    child: GlobalText(
                      softWrap: true,
                      text: 'Quiz Status: ${resultData['data']['status']}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: resultData['data']['status'] == 'passed'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Display individual results
            ...quizQuestionDataController.quizData.value!.data.quiz.questions
                .map((question) {
              final String questionId = question.id.toString();
              final Map<String, dynamic>? questionResult = results[questionId];
              final int? selectedAnswerId = questionResult?['answer'];
              final bool isCorrect = questionResult?['correct'] ?? false;

              // Find the correct answer for this question

              return Container(
                margin: EdgeInsets.only(bottom: 10.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.nuralItemBackgroundColor,
                ),
                child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    // Question Title
                    Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          text: "Q${question.id}. ",
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
                    // Display all answer options
                    ...question.answers.map((answer) {
                      final bool isSelected = answer.id == selectedAnswerId;

                      // Determine border color
                      Color borderColor = Colors.grey; // Default color
                      if (isSelected) {
                        borderColor = isCorrect ? Colors.green : Colors.red;
                      }

                      return Container(
                        margin: EdgeInsets.only(bottom: 10.sp),
                        width: double.infinity,
                        padding: EdgeInsets.all(11.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon for selected and correct/incorrect answers
                            if (isSelected)
                              Icon(
                                isCorrect ? Icons.check : Icons.close,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),

                            horizontalGap(10.sp),
                            Expanded(
                              child: GlobalText(
                                text: answer.title,
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
            }),
          ],
        ),
      ),
    );
  }
}
