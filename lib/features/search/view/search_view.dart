import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/widgets/dropdown_input.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/icons/app_icon.dart';
import '../../../core/images/app_image.dart';
import '../../../core/widgets/texts.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          child: Column(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.logo,
                    width: 80.53.sp,
                    height: 20.98.sp,
                  ),
                  Spacer(),
                  Bounceable(
                    onTap: () {},
                    child: SvgPicture.asset(AppIcon.crossIcon,
                        width: 15.sp, height: 15.sp),
                  )
                ],
              ),
              verticalGap(10.sp),
              GlobalText(
                text: 'Search',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
                softWrap: false,
              ),
              verticalGap(5.sp),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Search Courses",
                keyName: "Search Courses",
                inputType: TextInputType.text,
              ),
              verticalGap(10.sp),
              GlobalText(
                text: 'Search',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
                softWrap: false,
              ),
              verticalGap(5.sp),
              CustomDropDownField(),
            ],
          ),
        ),
      ),
    );
  }
}
