import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/widgets/controller/textfield_controller.dart';
import '../features/mulit_langual_data/controller/multi_langual_data_controller.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final String keyName; // Unique key for each text field
  final int minLines;
  final int maxLines;
  final bool? obscureText;
  final String? Function(String?)? validator; // Validator passed here

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.keyName, // Unique key

    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator, // Initialize validator
  });

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());

    TextfieldController textfieldController = Get.put(TextfieldController());
    String translatedText =
        multiLangualDataController.multiLangualData?[hint] ?? hint;

    return Obx(() {
      bool isObscure = textfieldController
          .getVisibility(keyName); // Get the specific visibility state
      return TextFormField(
        // Use TextFormField for validation
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        obscureText: isObscure,
        minLines: minLines,
        maxLines: maxLines,
        validator: validator, // Use the validator
        decoration: InputDecoration(
          suffixIcon: obscureText == false
              ? null
              : IconButton(
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    // Toggle visibility for the specific TextField
                    textfieldController.toggle(keyName);
                  },
                ),

          hintTextDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          hintText: translatedText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          fillColor: AppColors
              .primaryColor, // Optional: If you want a background color
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors
                    .primaryColor), // Set border color to primary color
            borderRadius: BorderRadius.circular(12.sp),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
        ),
        controller: controller,
        keyboardType: inputType,
      );
    });
  }
}
