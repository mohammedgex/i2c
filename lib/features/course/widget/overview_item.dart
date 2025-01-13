import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/texts.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class OverviewItem extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  const OverviewItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.sp,
            spreadRadius: 1.sp,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: SvgPicture.asset(icon),
          ),
          SizedBox(height: 5.sp),
          GlobalText(
            text: title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
            softWrap: true,
          ),
          SizedBox(height: 2.sp),
          GlobalText(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: Colors.blueAccent,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
