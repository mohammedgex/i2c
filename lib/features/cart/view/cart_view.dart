import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/appbar.dart';

import '../../../core/constant/constant.dart';
import '../../../core/images/app_image.dart';
import '../../../core/widgets/custom_rating_bar.dart';
import '../../../core/widgets/texts.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
      MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    return Scaffold(
      body: SafeArea(
          child: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                verticalPadding: 0,
                horizontalPadding: 0,
                isShowbackButton: true,
              ),
              GlobalText(
                text: "Cart",
                softWrap: true,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Slidable(
                key: const ValueKey(0),

                // The end action pane is the one at the right or the bottom side.
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 4,
                      onPressed: (value) {},
                      backgroundColor: AppColors.secondRedColor,
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ],
                ),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.sp),
                      color: AppColors.nuralItemBackgroundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: Row(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        children: [
                          Container(
                            height: 80.sp,
                            width: 103.sp,
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              AppImage.image1,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          horizontalGap(10.sp),
                          SizedBox(
                            width: 235.w,
                            child: Column(
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  text:
                                      'Master Laravel 11 & PHP: From Beginner to Advanced',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.titleTextColor),
                                  softWrap: true,
                                ),
                                verticalGap(3.sp),
                                GlobalText(
                                    text: 'Web Solution Us | 1000+ Students',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.titleTextColor),
                                    softWrap: true),
                                verticalGap(2.sp),
                                Row(
                                  textDirection:
                                      multiLangualDataController.isLTR.value
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  children: [
                                    CustomRatingBar(
                                      rating: 3.5,
                                      maxRating: 5,
                                      iconSize: 15.sp,
                                      filledColor: AppColors.activeIconColor,
                                      unfilledColor: AppColors.activeIconColor,
                                    ),
                                    Spacer(),
                                    Row(
                                      textDirection:
                                          multiLangualDataController.isLTR.value
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                      children: [
                                        GlobalText(
                                          text: '100',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.titleTextColor),
                                          softWrap: true,
                                        ),
                                        horizontalGap(3.sp),
                                        GlobalText(
                                          text: r'$50',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.titleTextColor),
                                          softWrap: true,
                                        ),
                                        horizontalGap(5.sp),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20.sp),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.nuralItemBackgroundColor,
          // borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Row(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GlobalText(
                text: r"Sub Total: $500",
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
              horizontalGap(10.sp),
              Bounceable(
                onTap: () {},
                child: Container(
                  height: 38.sp,
                  width: 150.sp,
                  decoration: BoxDecoration(
                    color: AppColors.activeIconColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalText(
                          text: "Check out",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        horizontalGap(5.sp),
                        SizedBox(
                            width: 15.sp,
                            child: SvgPicture.asset(AppIcon.arrowForwardIcon))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
