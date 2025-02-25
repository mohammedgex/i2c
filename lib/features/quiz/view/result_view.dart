import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';

class ResultView extends StatelessWidget {
  final Map<String, dynamic> resultData;

  const ResultView({super.key, required this.resultData});

  @override
  Widget build(BuildContext context) {
    // Parse the result string into a Map
    Map<String, dynamic> results = parseResult(resultData['data']['result']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ...results.entries.map((entry) {
              String questionId = entry.key;
              Map<String, dynamic> answerData = entry.value;
              bool isCorrect = answerData['correct'];

              return Container(
                margin: EdgeInsets.all(10.sp),
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      softWrap: true,
                      text: 'Question ID: $questionId',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                    verticalGap(10.sp),
                    GlobalText(
                      softWrap: true,
                      text: 'Selected Answer: ${answerData['answer']}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                    verticalGap(10.sp),
                    GlobalText(
                      softWrap: true,
                      text: 'Status: ${isCorrect ? 'Correct' : 'Incorrect'}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Helper function to parse the result string into a Map
  Map<String, dynamic> parseResult(String resultString) {
    return Map<String, dynamic>.from(jsonDecode(resultString));
  }
}
