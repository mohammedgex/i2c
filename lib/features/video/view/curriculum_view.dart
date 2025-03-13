import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/quiz/view/quiz_question_view.dart';
import 'package:skill_grow/features/video/controller/create_reply_controller.dart';
import 'package:skill_grow/features/video/controller/lesson_complete_status_update_controller.dart';
import 'package:skill_grow/features/video/controller/lesson_resource_file_download_controller.dart';
import 'package:skill_grow/features/video/widget/bottom_sheet.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../controller/learning_data_controller.dart';
import '../controller/qna_data_controller.dart';
import '../controller/video_play_controller.dart';

class CurriculumView extends StatefulWidget {
  final LearningDataController learningDataController;
  const CurriculumView({super.key, required this.learningDataController});

  @override
  State<CurriculumView> createState() => _CurriculumViewState();
}

class _CurriculumViewState extends State<CurriculumView> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, bool> _isExpandedMap = {};

  @override
  void initState() {
    super.initState();
    // Automatically expand the selected curriculum and scroll to it
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _expandAndScrollToSelectedCurriculum();
    });
  }

  void _expandAndScrollToSelectedCurriculum() {
    final selectedChapterId = widget
        .learningDataController.course.value!.data.currentProgress.chapterId;
    // final selectedLessonId =
    //     widget.learningDataController.course.value!.data.currentProgress.lessonId;

    // Find the index of the selected curriculum
    for (var i = 0;
        i < widget.learningDataController.course.value!.data.curriculums.length;
        i++) {
      if (widget.learningDataController.course.value!.data.curriculums[i].id ==
          selectedChapterId) {
        // Expand the selected curriculum
        setState(() {
          _isExpandedMap[i] = true;
        });

        // Scroll to the selected curriculum
        _scrollController.animateTo(
          i * 100.0, // Adjust this value based on your item height
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final LessonResourceFileDownloadController
        lessonResourceFileDownloadController =
        Get.put(LessonResourceFileDownloadController());
    final MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final LessonCompleteStatusUpdateController
        lessonCompleteStatuseUpdateController =
        Get.put(LessonCompleteStatusUpdateController());
    final QuizCompleteStatusUpdateController
        quizCompleteStatusUpdateController =
        Get.put(QuizCompleteStatusUpdateController());
    final CreateQuestionController createQuestionController =
        Get.put(CreateQuestionController());
    final QnaDataController qnaDataController = Get.put(QnaDataController());
    final VideoPlayController videoPlayController =
        Get.put(VideoPlayController());
    CreateReplyController createReplyController =
        Get.put(CreateReplyController());

    void fetchQNA(lesson_id, slug) {
      createQuestionController.lessonId = lesson_id.toString();
      createQuestionController.slug = slug;
      createReplyController.lessonId = lesson_id.toString();
      createReplyController.slug = slug.toString();
      qnaDataController.fetchQnaData(
          lessonId: lesson_id.toString(), slug: slug);
    }

    RxString selectedIndex = widget
        .learningDataController.course.value!.data.currentProgress.lessonId
        .toString()
        .obs;

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          widget.learningDataController.course.value!.data.curriculums.length,
      itemBuilder: (context, index) {
        final curriculums =
            widget.learningDataController.course.value!.data.curriculums[index];
        final isSelectedCurriculum = widget.learningDataController.course.value!
                .data.currentProgress.chapterId ==
            curriculums.id;

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpandedMap[index] = !(_isExpandedMap[index] ?? false);
                });
              },
              child: Container(
                padding: EdgeInsets.all(10.sp),
                color: AppColors.nuralItemBackgroundColor,
                child: Row(
                  children: [
                    Expanded(
                      child: GlobalText(
                        text: curriculums.title,
                        softWrap: true,
                        style: isSelectedCurriculum
                            ? TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.titleTextColor),
                      ),
                    ),
                    Icon(
                      _isExpandedMap[index] == true
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isExpandedMap[index] == true
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Column(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(curriculums.chapters.length, (index) {
                  final chapter = curriculums.chapters[index];
                  if (chapter.type == "lesson") {
                    if (videoPlayController.initialVideoDetails.isEmpty) {
                      videoPlayController.initialVideoDetails.value = {
                        "id": chapter.item.id,
                        "slug": widget.learningDataController.slug,
                        "type": "lesson"
                      };
                    }

                    return Container(
                      height: 50.sp,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: Bounceable(
                        onTap: () {
                          videoPlayController.initialVideoDetails.value = {
                            "id": chapter.item.id,
                            "slug": widget.learningDataController.slug,
                            "type": "lesson"
                          };
                          videoPlayController.fetchVideoFile(
                            slug: widget.learningDataController.slug,
                            type: "lesson",
                            id: chapter.item.id.toString(),
                          );

                          fetchQNA(chapter.item.id,
                              widget.learningDataController.slug);

                          selectedIndex.value = chapter.item.id.toString();
                        },
                        child: ListTile(
                            leading: GetBuilder<
                                LessonCompleteStatusUpdateController>(
                              id: 'lessonStatus', // Only updates when this tag is triggered
                              builder: (controller) {
                                if (widget.learningDataController.course.value!
                                    .data.alreadyWatchedLectures
                                    .contains(
                                  chapter.item.id,
                                )) {
                                  return Bounceable(
                                    onTap: () {
                                      lessonCompleteStatuseUpdateController
                                          .sendStatus(
                                        lessonId: chapter.item.id.toString(),
                                      );
                                    },
                                    child: Container(
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
                                    ),
                                  );
                                } else {
                                  return Bounceable(
                                    onTap: () {
                                      lessonCompleteStatuseUpdateController
                                          .sendStatus(
                                        lessonId: chapter.item.id.toString(),
                                      );
                                    },
                                    child: Container(
                                      height: 20.sp,
                                      width: 20.sp,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          color: Colors.transparent),
                                    ),
                                  );
                                }
                              },
                            ),
                            title: Obx(() {
                              return GlobalText(
                                text: chapter.item.title.toString(),
                                softWrap: true,
                                style: selectedIndex.value ==
                                        chapter.item.id.toString()
                                    ? TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.titleTextColor,
                                      ),
                              );
                            }),
                            subtitle: Obx(() {
                              return GlobalText(
                                text: chapter.item.duration.toString(),
                                softWrap: true,
                                style: selectedIndex.value ==
                                        chapter.item.id.toString()
                                    ? TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : TextStyle(fontSize: 10.sp),
                              );
                            }),
                            trailing: SvgPicture.asset(
                              AppIcon.playIcon,
                              color: AppColors.activeIconColor,
                            )),
                      ),
                    );
                  } else if (chapter.type == "quiz") {
                    return Container(
                      height: 50.sp,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: ListTile(
                        onTap: () {
                          Get.to(() => QuizQuestionView(
                                questionId: chapter.item.id.toString(),
                                slug: widget.learningDataController.slug,
                              ));
                          fetchQNA(chapter.item.id,
                              widget.learningDataController.slug);
                        },
                        leading: GetBuilder<QuizCompleteStatusUpdateController>(
                          id: 'quizStatus', // Match this with the update() call in the controller
                          builder: (controller) {
                            if (widget.learningDataController.course.value!.data
                                .alreadyCompletedQuiz
                                .contains(chapter.item.id)) {
                              return Bounceable(
                                onTap: () {
                                  quizCompleteStatusUpdateController.sendStatus(
                                    quizId: chapter.item.id.toString(),
                                  );
                                },
                                child: Container(
                                  height: 20.sp,
                                  width: 20.sp,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.sp),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Center(
                                    child:
                                        SvgPicture.asset(AppIcon.successIcon),
                                  ),
                                ),
                              );
                            } else {
                              return Bounceable(
                                onTap: () {
                                  quizCompleteStatusUpdateController.sendStatus(
                                    quizId: chapter.item.id.toString(),
                                  );
                                },
                                child: Container(
                                  height: 20.sp,
                                  width: 20.sp,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.sp),
                                    color: Colors.transparent,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        title: Obx(() {
                          return GlobalText(
                            text: chapter.item.title.toString(),
                            softWrap: true,
                            style: widget.learningDataController.course.value!
                                        .data.currentProgress.lessonId ==
                                    chapter.item.id
                                ? TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  )
                                : TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.titleTextColor,
                                  ),
                          );
                        }),
                        trailing: SvgPicture.asset(
                          height: 16.sp,
                          width: 16.sp,
                          AppIcon.quiz,
                          color: AppColors.activeIconColor,
                        ),
                      ),
                    );
                  } else {
                    return Bounceable(
                      onTap: () {
                        lessonResourceFileDownloadController.fetchResource(
                            slug: widget.learningDataController.slug,
                            type: "document",
                            lessonId: chapter.item.id.toString());
                        Get.bottomSheet(ResourceDownloadBottomSheet());
                      },
                      child: Container(
                          height: 50.sp,
                          margin: EdgeInsets.symmetric(vertical: 5.sp),
                          child: ListTile(
                            leading: SvgPicture.asset(
                              AppIcon.downloadIcon,
                              color: AppColors.primaryColor,
                            ),
                            title: GlobalText(
                              text: chapter.item.title.toString(),
                              softWrap: true,
                              style: widget.learningDataController.course.value!
                                          .data.currentProgress.lessonId ==
                                      chapter.item.id
                                  ? TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.titleTextColor),
                            ),
                            trailing: SizedBox(
                              height: 20.sp,
                              width: 20.sp,
                              child: SvgPicture.asset(
                                AppIcon.fileIcon,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )),
                    );
                  }
                }),
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
