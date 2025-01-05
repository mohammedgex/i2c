// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/categories/controller/category_itme_controller.dart';

import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class CategoryAllItemView extends StatelessWidget {
  CategoryAllItemView({super.key});

  MultiLangualDataController multiLangualDataController =
      Get.put(MultiLangualDataController());
  CategoryItemController controller = Get.put(CategoryItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                horizontalPadding: 0,
                verticalPadding: 0.sp,
                isShowbackButton: true,
              ),
              verticalGap(10.sp),
              GlobalText(
                text: 'Categories',
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
                softWrap: false,
              ),
              verticalGap(10.sp),
              Obx(() {
                if (controller.isLoading.value) {
                  return Wrap(
                    spacing: 20.sp,
                    runSpacing: 20.sp,
                    children: List.generate(10, (index) {
                      return Shimmer.fromColors(
                        baseColor: AppColors.nuralItemBackgroundColor,
                        highlightColor: AppColors.shimmerBackgroundColor,
                        child: Bounceable(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  height: 44.sp,
                                  width: 44.sp,
                                  decoration: BoxDecoration(
                                    color: AppColors.nuralItemBackgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                verticalGap(3.sp),
                                Container(
                                  height: 11.sp,
                                  width: 50.sp,
                                  decoration: BoxDecoration(
                                    color: AppColors.nuralItemBackgroundColor,
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
                  );
                } else {
                  return Wrap(
                    // itemWidth: 44.sp,
                    // maxLines: 12,
                    spacing: 20.sp,
                    runSpacing: 20.sp,
                    children:
                        List.generate(controller.categoryList.length, (index) {
                      return Bounceable(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                height: 44.sp,
                                width: 44.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.nuralItemBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    controller.categoryList[index]["image"],
                                  ),
                                ),
                              ),
                              verticalGap(3.sp),
                              GlobalText(
                                text: controller.categoryList[index]["name"],
                                style: TextStyle(
                                  color: AppColors.smallTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: false,
                              ),
                            ],
                          ));
                    }),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
