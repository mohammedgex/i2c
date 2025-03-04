import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.nuralItemBackgroundColor,
      highlightColor: AppColors.shimmerBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.nuralItemBackgroundColor,
                  ),
                ),
                horizontalGap(10.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10.sp,
                      width: 100.sp,
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    verticalGap(10.sp),
                    CustomRatingBar(
                      rating: 5.0,
                      iconSize: 20.sp,
                    ),
                    verticalGap(10.sp),
                    Container(
                      height: 10.sp,
                      width: 250.sp,
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    verticalGap(5.sp),
                    Container(
                      height: 10.sp,
                      width: 200.sp,
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    verticalGap(5.sp),
                    Container(
                      height: 10.sp,
                      width: 250.sp,
                      decoration: BoxDecoration(
                        color: AppColors.nuralItemBackgroundColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}