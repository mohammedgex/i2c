import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class WelcomeSction extends StatelessWidget {
  const WelcomeSction({super.key});

  @override
  Widget build(BuildContext context) {  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.sp),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.nuralItemBackgroundColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Row(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Shakil Ahmed 👋",
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 16.sp / 15.sp,
                      ),
                    ),
                    Text(
                      "Let’s start learning!",
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: 12.sp / 5.sp,
                      ),
                    ),
                  ]),
              Spacer(),
              FittedBox(
                child: Bounceable(
                    onTap: () {},
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        Text(
                          "Continue Learning",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        horizontalGap(2.sp),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                          size: 9.sp,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
