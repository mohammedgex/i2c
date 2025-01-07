import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';

class OverviewItem extends StatelessWidget {
  const OverviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 13.sp, width: 13.sp, child: SvgPicture.asset(AppIcon.date)),
        horizontalGap(5.sp),
        GlobalText(
          softWrap: true,
          text: "Last updated",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        horizontalGap(3.sp),
        GlobalText(
          text: ":",
          softWrap: true,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        horizontalGap(3.sp),
        GlobalText(
          text: "11/2024",
          softWrap: true,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        horizontalGap(3.sp),
      ],
    );
  }
}
