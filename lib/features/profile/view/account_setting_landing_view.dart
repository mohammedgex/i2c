import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';

class AccountSettingLandingView extends StatelessWidget {
  const AccountSettingLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 15.sp),child: Column(
          children: [
            MyCustomAppBar(
              verticalPadding: 0,
              horizontalPadding: 0,
              isShowbackButton: true,
            ),
            verticalGap(10.sp),
            
          ],
        ),),
      ),
    );
  }
}