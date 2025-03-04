import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/course/controller/course_details_controller.dart';

class OverviewSection extends StatelessWidget {
  final CourseDetalisController courseDetalisController;

  const OverviewSection({super.key, required this.courseDetalisController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalText(
              text: "Description",
              softWrap: true,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalGap(10.sp),
            HtmlGlobalText(
              text: courseDetalisController.course.value!.description,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}