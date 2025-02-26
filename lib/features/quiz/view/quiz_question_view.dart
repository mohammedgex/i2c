import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/quiz/controller/submit_answer_controller.dart';
import 'package:skill_grow/features/quiz/model/quiz_question_model.dart';
import 'package:skill_grow/features/quiz/widgets/question_view.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../controller/state_controller.dart';
import '../controller/question_data_get_controller.dart';

class QuizQuestionView extends StatelessWidget {
  final String questionId;
  final String slug;
  QuizQuestionView({super.key, required this.questionId, required this.slug});

  RxBool isShowInfo = true.obs;
  @override
  Widget build(BuildContext context) {
    final QuizQuestionDataController quizQuestionDataController =
        Get.put(QuizQuestionDataController());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final CountdownController countdownController =
        Get.put(CountdownController());
       

    quizQuestionDataController.fetchQuiz(course_slug: slug, id: questionId);

    return Scaffold(
      body: Obx(() {
        if (quizQuestionDataController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (quizQuestionDataController.quizData.value == null) {
            return _buildNoDataView();
          } else {
            var data = quizQuestionDataController.quizData.value!.data;
            countdownController.setTimeFromMinutes(data.quiz.time);
            return _buildQuizView(
                data, multiLangualDataController, countdownController);
          }
        }
      }),
    );
  }

  ColorfulSafeArea _buildNoDataView() {
    return ColorfulSafeArea(
      color: AppColors.scaffoldBackgroundColor,
      child: Column(
        children: [
          MyCustomAppBar(
              verticalPadding: 0,
              horizontalPadding: 10.sp,
              isShowbackButton: true),
          Spacer(),
          GlobalText(text: "No data available", softWrap: true),
          Spacer(),
        ],
      ),
    );
  }

  ColorfulSafeArea _buildQuizView(
    QuizData data,
    MultiLangualDataController multiLangualDataController,
    CountdownController countdownController,
  ) {
     QuizSubmissionController quizSubmissionController = Get.put(QuizSubmissionController());
    return ColorfulSafeArea(
      bottom: true,
      color: AppColors.scaffoldBackgroundColor,
      child: Column(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCustomAppBar(
              verticalPadding: 0,
              horizontalPadding: 10.sp,
              isShowbackButton: true),
          verticalGap(5.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: _buildQuizTitle(data),
          ),
          verticalGap(10.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: _buildQuizStats(
                data, countdownController, multiLangualDataController),
          ),
          verticalGap(10.sp),
          Obx(() {
            if (isShowInfo.value) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: _buildInfoCard(multiLangualDataController),
              );
            } else {
              return SizedBox();
            }
          }),
          verticalGap(10.sp),
          Expanded(child: QuestionView()),
          verticalGap(10.sp),
          Center(
            child: GlobalButton(
                height: 40.sp,
                width: 320.sp,
                text: "Submint",
                onTap: () {
                  quizSubmissionController.submitAnswers(
                    quizId: questionId,
                    slug: slug,
                  );
                }),
          ),
        ],
      ),
    );
  }

  GlobalText _buildQuizTitle(QuizData data) {
    return GlobalText(
      softWrap: true,
      text: data.quiz.title,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.titleTextColor,
      ),
    );
  }

  Row _buildQuizStats(QuizData data, CountdownController countdownController,
      MultiLangualDataController multiLangualDataController) {
    return Row(
      spacing: 5.sp,
      textDirection: multiLangualDataController.isLTR.value
          ? TextDirection.ltr
          : TextDirection.rtl,
      children: [
        _buildStatCard(
          value: data.quiz.passMark.toString(),
          total: data.quiz.totalMark.toString(),
          label: "Minimum Marks",
          backgroundColor: AppColors.successSnackIconBackgroundColor,
        ),
        _buildStatCard(
          value: data.attempt.toString(),
          total: data.quiz.attempt.toString(),
          label: "Attempts",
          backgroundColor: AppColors.infoSnackIconBackgroundColor,
        ),
        _buildStatCard(
          value: data.quiz.totalQuestions.toString(),
          label: "Questions",
          backgroundColor: AppColors.warningSnackIconBackgroundColor,
        ),
        _buildTimerCard(countdownController),
      ],
    );
  }

  Flexible _buildStatCard({
    required String value,
    String? total,
    required String label,
    required Color backgroundColor,
  }) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(5.sp),
        height: 70.sp,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value, style: _statTextStyle()),
                if (total != null) ...[
                  GlobalText(
                    text: "/",
                    style: _statTextStyle(),
                    softWrap: true,
                  ),
                  Text(total, style: _statTextStyle()),
                ],
              ],
            ),
            GlobalText(
              softWrap: true,
              text: label,
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
    );
  }

  TextStyle _statTextStyle() {
    return TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  Flexible _buildTimerCard(CountdownController countdownController) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(5.sp),
        height: 70.sp,
        decoration: BoxDecoration(
          color: AppColors.failedSnackIconBackgroundColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
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
                    color: Colors.white,
                  ),
                );
              }),
            ),
            GlobalText(
              softWrap: true,
              text: "Remaining Time",
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
    );
  }

  Container _buildInfoCard(
      MultiLangualDataController multiLangualDataController) {
    return Container(
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
              child: SvgPicture.asset(AppIcon.infoIcon),
            ),
            Expanded(
              child: Column(
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
                    text: "Form will be auto submitted when time runs out!",
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
              onTap: () {
                isShowInfo.value = false;
              },
              child: Container(
                padding: EdgeInsets.all(3.sp),
                height: 22.sp,
                width: 22.sp,
                child: SvgPicture.asset(AppIcon.crossIcon, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
