import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

class ErnrollerdCourseLoaingUi extends StatelessWidget {
  const ErnrollerdCourseLoaingUi({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Center(
            child: CircularProgressIndicator(),
          );
    
  }
}
