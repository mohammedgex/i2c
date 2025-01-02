import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/wrapper_with_max_line.dart';
import 'package:skill_grow/features/categories/controller/category_itme_controller.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});
  CategoryItemController categoryItmeController =
      Get.put(CategoryItemController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.5.sp),
      child: Obx(() {
        if (categoryItmeController.isLoading.value) {
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
          return WrapWithMaxLines(
            itemWidth: 44.sp,
            maxLines: 2,
            spacing: 20.sp,
            runSpacing: 20.sp,
            children: List.generate(
                categoryItmeController.categoryList.length < 10
                    ? categoryItmeController.categoryList.length
                    : 10, (index) {
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
                            categoryItmeController.categoryList[index]["image"],
                          ),
                        ),
                      ),
                      verticalGap(3.sp),
                      Text(
                        categoryItmeController.categoryList[index]["name"],
                        style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ));
            }),
          );
        }
      }),
    );
  }
}
