import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/course/widget/overview_item.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

import '../../../core/icons/app_icon.dart';
import '../controller/course_details_controller.dart';

class CourseInfo extends StatelessWidget {
 final CourseDetalisController courseDetalisController;
  const CourseInfo({super.key, required this.courseDetalisController});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        alignment: WrapAlignment.spaceBetween,
        direction:
            Axis.horizontal, // Ensures children are laid out horizontally

        // spacing: 20.0, // Horizontal spacing between children
        runSpacing: 10.0, // Vertical spacing between lines
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        children: [
          OverviewItem(
            title: "آخر تحديث",
            value: courseDetalisController.course.value!.lastUpdated,
            icon: AppIcon.date,
          ),
          OverviewItem(
            title: "مدة الكورس",
            value: courseDetalisController.course.value!.duration,
            icon: AppIcon.duration,
          ),
          OverviewItem(
            title: "شهادة إتمام",
            value: courseDetalisController.course.value!.certificate
                ? "نعم"
                : "لا",
            icon: AppIcon.certificate,
          ),
          OverviewItem(
            title: "عدد الدروس",
            value:
                courseDetalisController.course.value!.lessonsCount.toString(),
            icon: AppIcon.lecture,
          ),
        ],
      ),
    );
  }
}
