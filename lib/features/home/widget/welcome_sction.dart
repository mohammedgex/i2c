import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/learining/view/learing_view.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class WelcomeSction extends StatelessWidget {
  const WelcomeSction({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.sp),
      child: Obx(() {
        if (profileDataCotroller.isLoading.value) {
          return Shimmer.fromColors(
              baseColor: AppColors.shimmerBackgroundColor,
              highlightColor: AppColors.nuralItemBackgroundColor,
              child: Container(
                  width: double.infinity,
                  height: 100.sp,
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
                      ))));
        } else {
          return Container(
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
                          "Hi,${profileDataCotroller.userDataResponse.value!.data.name} 👋",
                          style: TextStyle(
                            color: AppColors.titleTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 16.sp / 15.sp,
                          ),
                        ),
                        GlobalText(
                          softWrap: true,
                          text: "Let’s start learning!",
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
                        onTap: () {
                          Get.to(() => LearingView(
                                isShowbackButton: true,
                              ));
                        },
                        child: Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          children: [
                            GlobalText(
                              softWrap: false,
                              text: "Continue Learning",
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
          );
        }
      }),
    );
  }
}
