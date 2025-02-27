// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/controller/learning_data_controller.dart';

class CourseDescriptionView extends StatelessWidget {
  const CourseDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    LearningDataController learningDataController = Get.find<LearningDataController>();
    return Scaffold(
      body: Padding(padding: 
      EdgeInsets.symmetric(horizontal: 15.sp), child: Column(
        children: [
          MyCustomAppBar(
            verticalPadding: 0,horizontalPadding: 0, isShowNotification: true,isShowbackButton: true,
          ),
          Obx((){
            if (learningDataController.course.value!.data.description.isEmpty || learningDataController.course.value!.data.description == null) {
              return GlobalText(text: "No Description Available");
            } else {
              return HtmlGlobalText(text: learningDataController.course.value!.data.description, softWrap: true);
            }
          })
        ],
      ),),
    );
  }
}