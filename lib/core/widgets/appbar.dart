import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';

import '../../features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../colors/app_colors.dart';
import '../icons/app_icon.dart';
import '../images/app_image.dart';

class MyCustomAppBar extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool isShowbackButton;
   MyCustomAppBar(
      {super.key,
      this.horizontalPadding,
      this.verticalPadding,
      this.isShowbackButton = false});
        MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 25.sp,
          vertical: verticalPadding ?? 10.sp),
      child: Row(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isShowbackButton)
            Bounceable(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                // color: Colors.red,
                height: 25.sp,
                // width: 20.sp,
                child: SvgPicture.asset(
                  AppIcon.arrowBackIcon,
                  width: 13.sp,
                  height: 13.sp,
                ),
              ),
            ),
          if (isShowbackButton) horizontalGap(15.sp),
          Image.asset(
            AppImage.logo,
            width: 80.53.sp,
            height: 20.98.sp,
          ),
          Spacer(),
          SizedBox(
            child: Bounceable(
              onTap: () {},
              child: Stack(
                children: [
                  SizedBox(
                    height: 40.sp,
                    // width: 40.sp,
                    child: SvgPicture.asset(
                      AppIcon.cartIcon,
                      width: 19.98.sp,
                      height: 20.sp,
                    ),
                  ),
                  Positioned(
                    top: 5.sp,
                    right: 3.sp,
                    child: Container(
                      height: 10.sp,
                      width: 10.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainRedColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.sp),
                        child: Center(
                          child: FittedBox(
                            child: GlobalText(
                              text: "10",
                              style: TextStyle(
                                  color: AppColors.scaffoldBackgroundColor,
                                  fontWeight: FontWeight.w900),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
