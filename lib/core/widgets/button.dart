import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/colors/app_colors.dart';

class GlobalButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const GlobalButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.globalButtonTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              height: 14.52.sp / 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
