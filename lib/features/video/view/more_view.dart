import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/features/video/view/announcements_view.dart';

import '../../../core/widgets/texts.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Container(
      padding: EdgeInsets.all(15.sp),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.nuralItemBackgroundColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          spacing: 10.sp,
          children: [
            Bounceable(
              onTap: () {},
              child: Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  SvgPicture.asset(AppIcon.more),
                  horizontalGap(15.sp),
                  GlobalText(
                    text: "About This Course",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Bounceable(
              onTap: () {},
              child: Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  SvgPicture.asset(AppIcon.courseCertificate),
                  horizontalGap(15.sp),
                  GlobalText(
                    text: "Course certificate",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Bounceable(
              onTap: () {},
              child: Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  SvgPicture.asset(AppIcon.share),
                  horizontalGap(15.sp),
                  GlobalText(
                    text: "Share this Course",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Bounceable(
              onTap: () {
                Get.to(() => AnnouncementsView());
              },
              child: Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  SvgPicture.asset(AppIcon.announcements),
                  horizontalGap(15.sp),
                  GlobalText(
                    text: "Announcements",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
