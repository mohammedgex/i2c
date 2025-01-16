import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/texts.dart';

import '../../../core/constant/constant.dart';
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
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Row(
      mainAxisSize: MainAxisSize.min, // Use minimal width to fit children
      textDirection: multiLangualDataController.isLTR.value
          ? TextDirection.ltr
          : TextDirection.rtl,
      children: [
        SizedBox(
          height: 11.sp,
          width: 11.sp,
          child: SvgPicture.asset(icon),
        ),
        horizontalGap(2.sp),
        GlobalText(
          text: title,
          softWrap: true,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
        ),
        GlobalText(
          text: " : ",
          softWrap: true,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
        ),
        GlobalText(
          text: value,
          softWrap: true,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
