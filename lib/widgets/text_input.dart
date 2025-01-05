import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../features/mulit_langual_data/controller/multi_langual_data_controller.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    String translatedText =
        multiLangualDataController.multiLangualData?[hint] ?? hint;
    return Container(
      height: 50.sp,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: translatedText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
        ),
        controller: controller,
        keyboardType: inputType,
      ),
    );
  }
}
