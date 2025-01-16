import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class CourserDetailsLoading extends StatelessWidget {
  const CourserDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());

    return Shimmer.fromColors(
                baseColor: AppColors.nuralItemBackgroundColor,
                highlightColor: AppColors.shimmerBackgroundColor,
                child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyCustomAppBar(
                      horizontalPadding: 0,
                      verticalPadding: 0,
                      isShowbackButton: true,
                    ),
                    verticalGap(10.sp),
                    Container(
                      width: double.infinity,
                      height: 200.sp,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    verticalGap(10.sp),
                    Container(
                      width: double.infinity,
                      height: 10.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.nuralItemBackgroundColor),
                    ),
                    verticalGap(5.sp),
                    Container(
                      width: 150.sp,
                      height: 10.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.nuralItemBackgroundColor),
                    ),
                    verticalGap(7.sp),
                    Container(
                      width: 250.sp,
                      height: 10.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.nuralItemBackgroundColor),
                    ),
                    verticalGap(10.sp),
                    Container(
                      width: 70.sp,
                      height: 10.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.nuralItemBackgroundColor),
                    ),
                    verticalGap(10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50.sp,
                              height: 10.sp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: AppColors.nuralItemBackgroundColor),
                            ),
                            verticalGap(5.sp),
                            Container(
                              width: 100.sp,
                              height: 10.sp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: AppColors.nuralItemBackgroundColor),
                            ),
                          ],
                        ),
                        Container(
                            width: 100.sp,
                            height: 40.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(
                                    color: AppColors.nuralItemBackgroundColor,
                                    width: 2.sp))),
                        Container(
                          width: 100.sp,
                          height: 40.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: AppColors.nuralItemBackgroundColor),
                        ),
                      ],
                    ),
                    verticalGap(10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 100.sp,
                            height: 40.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(
                                    color: AppColors.nuralItemBackgroundColor,
                                    width: 2.sp))),
                        Container(
                          width: 100.sp,
                          height: 40.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: AppColors.nuralItemBackgroundColor),
                        ),
                        Container(
                          width: 100.sp,
                          height: 40.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: AppColors.nuralItemBackgroundColor),
                        ),
                      ],
                    ),
                    verticalGap(10.sp),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.nuralItemBackgroundColor,
                              width: 2.sp),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              subtitle: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              trailing: Container(
                                width: 50.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                            ),
                            ListTile(
                              title: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              subtitle: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              trailing: Container(
                                width: 50.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                            ),
                            ListTile(
                              title: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              subtitle: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              trailing: Container(
                                width: 50.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                            ),
                            ListTile(
                              title: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              subtitle: Container(
                                width: 100.sp,
                                height: 10.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                              trailing: Container(
                                width: 50.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.nuralItemBackgroundColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}