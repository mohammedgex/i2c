import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/widgets/controller/dropdwon_input_cntroller.dart';

class CustomDropDownField extends StatelessWidget {
  final DropdownController controller = Get.put(DropdownController());
  final MultiLangualDataController multiLangualDataController =
      Get.put(MultiLangualDataController());

  CustomDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Determine text direction based on language
      final textDirection = multiLangualDataController.isLTR.value
          ? TextDirection.ltr
          : TextDirection.rtl;

      return Directionality(
        textDirection: textDirection,
        child: DropdownButton2<String>(
          value: controller.selectedValue.value.isEmpty
              ? null
              : controller.selectedValue.value,
          onChanged: (String? newValue) {
            controller.updateValue(newValue);
          },
          items: controller.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              alignment: multiLangualDataController.isLTR.value
                  ? AlignmentDirectional.centerStart
                  : AlignmentDirectional.centerEnd,
              value: value,
              child: GlobalText(
                text: value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: controller.selectedValue.value == value
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                softWrap: false,
              ),
            );
          }).toList(),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          iconStyleData: IconStyleData(
            icon: const Icon(Icons.arrow_drop_down),
          ),
          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(color: Colors.grey),
            ),
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: TextEditingController(),
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              child: TextField(
                decoration: InputDecoration(
                  hintText: translatedText("Search"),
                  hintTextDirection: textDirection,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
            ),
          ),
          hint: GlobalText(
            text: translatedText("Search or select an option"),
            style: TextStyle(fontSize: 14.sp),
            softWrap: false,
          ),
        ),
      );
    });
  }
}
