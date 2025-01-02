import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
                isShowbackButton: false,
              ),
              verticalGap(10.sp),
              GlobalText(
                text: 'Search',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
                softWrap: false,
              ),
              verticalGap(10.sp),
            ],
          ),
        ),
      ),
    );
  }
}
