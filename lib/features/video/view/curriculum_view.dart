import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/widgets/checkbox.dart';

import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class CurriculumView extends StatelessWidget {
  const CurriculumView({super.key});

  @override
  Widget build(BuildContext context) {  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    return Column(
      textDirection: multiLangualDataController.isLTR.value
          ? TextDirection.ltr
          : TextDirection.rtl,
      children: [
        Accordion(
            rightIcon: SvgPicture.asset(AppIcon.arrowDownIcon),
            children: [
              AccordionSection(
                headerBackgroundColor: AppColors.nuralItemBackgroundColor,
                contentBackgroundColor: AppColors.nuralItemBackgroundColor,
                headerBorderColor: AppColors.nuralItemBackgroundColor,
                contentBorderColor: AppColors.nuralItemBackgroundColor,
                headerPadding: EdgeInsets.all(10.sp),
                isOpen: true,
                header: GlobalText(
                  text: "Introduction",
                  softWrap: true,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                content: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40.sp,
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomRectangleCheckBox(),
                            horizontalGap(10.sp),
                            Column(
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  text: "How To Work With Laravel 8",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                  softWrap: true,
                                ),
                                GlobalText(
                                  text: "1h 30m",
                                  style: TextStyle(fontSize: 10.sp),
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Spacer(),
                            SizedBox(
                              height: 22.sp,
                              width: 22.sp,
                              child: SvgPicture.asset(AppIcon.playIcon),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])
      ],
    );
  }
}
