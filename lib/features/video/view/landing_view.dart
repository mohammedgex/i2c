import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/course/widget/loading_ui.dart';
import 'package:skill_grow/features/video/controller/learning_data_controller.dart';
import 'package:skill_grow/features/video/controller/state_controller.dart';
import 'package:skill_grow/features/video/controller/video_play_controller.dart';
import 'package:skill_grow/features/video/view/QNA_view.dart';
import 'package:skill_grow/features/video/view/curriculum_view.dart';
import 'package:skill_grow/features/video/view/more_view.dart';
import 'package:skill_grow/features/video/view/widget/initial_tumbnail_ui.dart';
import 'package:skill_grow/features/video_player/view/view_player_view.dart';
import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class LandingViewForVideo extends StatelessWidget {
  String slug;
  LandingViewForVideo({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    VideoPlayController videoPlayController = Get.put(VideoPlayController());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    final ResourseToggleController controller =
        Get.put(ResourseToggleController());
    final LearningDataController learningDataController =
        Get.put(LearningDataController(slug));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ColorfulSafeArea(
        bottom: false,
        maintainBottomViewPadding: true,
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
          child: Obx(() {
            if (learningDataController.isLoading.value) {
              return Center(
                child: CourserDetailsLoading(),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize
                    .min, // Allows Column to shrink-wrap its content
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
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
                      child: Obx(() {
                        if (videoPlayController.isLoading.value) {
                          return InitialTumbnailUI(
                              isShowWishIcon: false,
                              thumbnailImage: learningDataController
                                  .course.value!.data.thumbnail,
                              wishOntap: () {},
                              playOntap: () {
                                videoPlayController.fetchVideoFile(
                                    slug: videoPlayController
                                        .initialVideoDetails['slug']
                                        .toString(),
                                    type: videoPlayController
                                        .initialVideoDetails['type']
                                        .toString(),
                                    id: learningDataController.course.value!
                                        .data.currentProgress.chapterId
                                        .toString());
                              });
                        } else {
                          if (videoPlayController.videoFile.value != null) {
                            return VideoScreen(
                                videoSource: videoPlayController
                                    .videoFile.value!.data.storage,
                                videoUrl: videoPlayController
                                    .videoFile.value!.data.filePath);
                          } else {
                            return InitialTumbnailUI(
                                isShowWishIcon: false,
                                thumbnailImage: learningDataController
                                    .course.value!.data.thumbnail,
                                wishOntap: () {},
                                playOntap: () {
                                  videoPlayController.fetchVideoFile(
                                      slug: videoPlayController
                                          .initialVideoDetails['slug']
                                          .toString(),
                                      type: videoPlayController
                                          .initialVideoDetails['type']
                                          .toString(),
                                      id: learningDataController.course.value!
                                        .data.currentProgress.chapterId
                                        .toString());
                                });
                          }
                        }
                      })),
                  verticalGap(5.sp),
                  GlobalText(
                    text: learningDataController.course.value!.data.title,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                  ),
                  GlobalText(
                    text: learningDataController
                        .course.value!.data.instructor.name,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor),
                  ),
                  // Play YouTube Video

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
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
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
                                      borderRadius:
                                          BorderRadius.circular(7.sp)),
                                  child: Center(
                                    child: GlobalText(
                                      text: "Curriculum",
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: controller
                                                      .selectedIndex.value ==
                                                  0
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
                                      borderRadius:
                                          BorderRadius.circular(7.sp)),
                                  child: Center(
                                    child: GlobalText(
                                      text: "QNA",
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: controller
                                                      .selectedIndex.value ==
                                                  1
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
                                      borderRadius:
                                          BorderRadius.circular(7.sp)),
                                  child: Center(
                                    child: GlobalText(
                                      text: "More",
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: controller
                                                      .selectedIndex.value ==
                                                  2
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
                      return Flexible(
                          child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: CurriculumView(
                            learningDataController: learningDataController,
                          ),
                        ),
                      ));
                    } else if (controller.selectedIndex.value == 1) {
                      return Flexible(
                          child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: QNAView(),
                        ),
                      ));
                    } else {
                      return MoreView(slug: slug);
                    }
                  })
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
