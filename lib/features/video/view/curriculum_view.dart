import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/controller/lesson_complete_status_update_controller.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../controller/learning_data_controller.dart';
import '../controller/qna_data_controller.dart';

class CurriculumView extends StatelessWidget {
  LearningDataController learningDataController;
  CurriculumView({super.key, required this.learningDataController});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    LessonCompleteStatusUpdateController lessonCompleteStatuseUpdateController =
        Get.put(LessonCompleteStatusUpdateController());
    CreateQuestionController createQuestionController =
        Get.put(CreateQuestionController());
    QnaDataController qnaDataController = Get.put(QnaDataController());

    fetchQNA(lesson_id, slug) {
      createQuestionController.lessonId = lesson_id.toString();
      createQuestionController.slug = slug;
      qnaDataController.fetchQnaData(
          lessonId: lesson_id.toString(), slug: slug);
    }

    return Column(
      textDirection: multiLangualDataController.isLTR.value
          ? TextDirection.ltr
          : TextDirection.rtl,
      children: List.generate(
          learningDataController.course.value!.data.curriculums.length,
          (index) {
        var curriculums =
            learningDataController.course.value!.data.curriculums[index];
        return Directionality(
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
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
                contentBackgroundColor: AppColors.nuralItemBackgroundColor,
                contentBorderColor: Colors.transparent,
                header: GlobalText(
                  text: curriculums.title,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 13.sp, color: AppColors.titleTextColor),
                ),
                content: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(curriculums.chapters.length, (index) {
                    var chapter = curriculums.chapters[index];
                    if (chapter.type == "lesson") {
                      return Container(
                        constraints: BoxConstraints(minHeight: 50.sp),
                        margin: EdgeInsets.symmetric(vertical: 5.sp),
                        child: ListTile(
                            leading: Bounceable(
                              onTap: () {
                                lessonCompleteStatuseUpdateController
                                    .sendStatus(
                                  lessonId: chapter.item.id.toString(),
                                );
                              },
                              child: learningDataController
                                      .course.value!.data.alreadyWatchedLectures
                                      .contains(chapter.item.id)
                                  ? Container(
                                      height: 20.sp,
                                      width: 20.sp,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          color: AppColors.primaryColor),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            AppIcon.successIcon),
                                      ),
                                    )
                                  : Container(
                                      height: 20.sp,
                                      width: 20.sp,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          color: Colors.transparent),
                                    ),
                            ),
                            title: Bounceable(
                              onTap: () => fetchQNA(
                                  chapter.item.id, learningDataController.slug),
                              child: GlobalText(
                                text: chapter.item.title.toString(),
                                softWrap: true,
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ),
                            subtitle: Bounceable(
                              onTap: () => fetchQNA(
                                  chapter.item.id, learningDataController.slug),
                              child: GlobalText(
                                text: chapter.item.duration.toString(),
                                softWrap: true,
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ),
                            trailing: Bounceable(
                              onTap: () => fetchQNA(
                                  chapter.item.id, learningDataController.slug),
                              child: SvgPicture.asset(
                                AppIcon.playIcon,
                                color: AppColors.activeIconColor,
                              ),
                            )),
                      );
                    } else {
                      return Container(
                        height: 50.sp,
                        margin: EdgeInsets.symmetric(vertical: 5.sp),
                        child: ListTile(
                            leading: Bounceable(
                              onTap: () {
                                lessonCompleteStatuseUpdateController
                                    .sendStatus(
                                  lessonId: chapter.item.id.toString(),
                                );
                              },
                              child: GetBuilder<
                                  LessonCompleteStatusUpdateController>(
                                id: 'lessonStatus', // Only updates when this tag is triggered
                                builder: (controller) {
                                  return learningDataController.course.value!
                                          .data.alreadyWatchedLectures
                                          .contains(chapter.item.id)
                                      ? Container(
                                          height: 20.sp,
                                          width: 20.sp,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                              color: AppColors.primaryColor),
                                          child: Center(
                                            child: SvgPicture.asset(
                                                AppIcon.successIcon),
                                          ),
                                        )
                                      : Container(
                                          height: 20.sp,
                                          width: 20.sp,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                              color: Colors.transparent),
                                        );
                                },
                              ),
                            ),
                            title: Bounceable(
                              onTap: () => fetchQNA(
                                  chapter.item.id, learningDataController.slug),
                              child: GlobalText(
                                text: chapter.item.title.toString(),
                                softWrap: true,
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ),
                            subtitle: Bounceable(
                              onTap: () => fetchQNA(
                                  chapter.item.id, learningDataController.slug),
                              child: GlobalText(
                                text: "1h 30m",
                                softWrap: true,
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ),
                            trailing: Bounceable(
                              onTap: () => fetchQNA(
                                  chapter.item.id, learningDataController.slug),
                              child: SizedBox(
                                height: 17.sp,
                                width: 17.sp,
                                child: SvgPicture.asset(
                                  AppIcon.quiz,
                                  color: AppColors.activeIconColor,
                                ),
                              ),
                            )),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
