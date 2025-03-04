// import 'package:accordion/accordion.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bounceable/flutter_bounceable.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:skill_grow/core/colors/app_colors.dart';
// import 'package:skill_grow/core/icons/app_icon.dart';
// import 'package:skill_grow/core/widgets/texts.dart';
// import 'package:skill_grow/features/course/controller/course_details_controller.dart';
// import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
// import 'package:skill_grow/features/video/controller/video_play_controller.dart';

// import '../model/course_details_model.dart';

// class CurriculumItem extends StatelessWidget {
//   final Curriculum curriculum;
//   final MultiLangualDataController multiLangualDataController;
//   final CourseDetalisController courseDetalisController;

//   const CurriculumItem({
//     super.key,
//     required this.curriculum,
//     required this.multiLangualDataController,
//     required this.courseDetalisController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final VideoPlayController videoPlayController = Get.find();

//     return Directionality(
//       textDirection: multiLangualDataController.isLTR.value
//           ? TextDirection.ltr
//           : TextDirection.rtl,
//       child: Accordion(
//         disableScrolling: true,
//         contentVerticalPadding: 0,
//         paddingListTop: 0,
//         paddingListBottom: 0,
//         rightIcon: SvgPicture.asset(
//           AppIcon.arrowDownIcon,
//           color: Colors.black,
//         ),
//         children: [
//           AccordionSection(
//             headerPadding: EdgeInsets.all(10.sp),
//             headerBackgroundColor: AppColors.nuralItemBackgroundColor,
//             contentBackgroundColor: AppColors.nuralItemBackgroundColor,
//             contentBorderColor: Colors.transparent,
//             header: GlobalText(
//               text: curriculum.title,
//               softWrap: true,
//               style: TextStyle(
//                 fontSize: 13.sp,
//                 color: AppColors.titleTextColor,
//               ),
//             ),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: List.generate(
//                 curriculum.chapters.length,
//                 (index) => _buildChapterItem(
//                   curriculum.chapters[index],
//                   videoPlayController,
//                   multiLangualDataController,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChapterItem(
//     Chapter chapter,
//     VideoPlayController videoPlayController,
//     MultiLangualDataController multiLangualDataController,
//   ) {
//     if (chapter.type == "lesson") {
//       return _buildLessonItem(chapter.lesson!, videoPlayController);
//     } else if (chapter.type == "quiz") {
//       return _buildQuizItem(chapter.quiz!);
//     } else {
//       return _buildDefaultItem(chapter.lesson!);
//     }
//   }

//   Widget _buildLessonItem(Lesson lesson, VideoPlayController videoPlayController) {
//     return Bounceable(
//       onTap: lesson.isFree
//           ? () {
//               videoPlayController.initialVideoDetails.value = {
//                 "id": lesson.id.toString(),
//                 "slug": courseDetalisController.slug,
//                 "type": "lesson"
//               };
//               videoPlayController.fetchVideoFile(
//                 slug: courseDetalisController.slug,
//                 type: "lesson",
//                 id: lesson.id.toString(),
//               );
//             }
//           : null,
//       child: Container(
//         height: 50.sp,
//         margin: EdgeInsets.symmetric(vertical: 5.sp),
//         child: ListTile(
//           title: GlobalText(
//             text: lesson.title,
//             softWrap: true,
//           ),
//           subtitle: GlobalText(
//             text: lesson.duration,
//             softWrap: true,
//             style: TextStyle(fontSize: 10.sp),
//           ),
//           trailing: lesson.isFree
//               ? SvgPicture.asset(
//                   AppIcon.playIcon,
//                   color: AppColors.activeIconColor,
//                 )
//               : SizedBox(
//                   height: 17.sp,
//                   width: 17.sp,
//                   child: SvgPicture.asset(
//                     AppIcon.lockIcon,
//                     color: AppColors.activeIconColor,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuizItem(Quiz quiz) {
//     return Container(
//       height: 50.sp,
//       margin: EdgeInsets.symmetric(vertical: 5.sp),
//       child: ListTile(
//         title: GlobalText(
//           text: quiz.title,
//           softWrap: true,
//           style: TextStyle(fontSize: 13.sp),
//         ),
//         subtitle: GlobalText(
//           text: '',
//           softWrap: true,
//           style: TextStyle(fontSize: 10.sp),
//         ),
//         trailing: SizedBox(
//           height: 17.sp,
//           width: 17.sp,
//           child: SvgPicture.asset(
//             AppIcon.lockIcon,
//             color: AppColors.activeIconColor,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDefaultItem(Lesson lesson) {
//     return Container(
//       height: 50.sp,
//       margin: EdgeInsets.symmetric(vertical: 5.sp),
//       child: ListTile(
//         title: GlobalText(
//           text: lesson.title,
//           softWrap: true,
//           style: TextStyle(fontSize: 13.sp),
//         ),
//         subtitle: GlobalText(
//           text: '',
//           softWrap: true,
//           style: TextStyle(fontSize: 10.sp),
//         ),
//         trailing: SizedBox(
//           height: 17.sp,
//           width: 17.sp,
//           child: SvgPicture.asset(
//             AppIcon.lockIcon,
//             color: AppColors.activeIconColor,
//           ),
//         ),
//       ),
//     );
//   }
// }