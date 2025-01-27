import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/language/controller/language_list_controller.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/widgets/appbar.dart';
import '../controller/language_select_controller.dart';

class LanguageListView extends StatelessWidget {
  const LanguageListView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    LanguageListController languageListController =
        Get.put(LanguageListController());
    LanguageSelectionController languageSelectionController =
        Get.put(LanguageSelectionController());

    return Obx(
      () {
        if (languageListController.isLoading.value) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            body: ColorfulSafeArea(
              bottom: false,
              color: AppColors.scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    MyCustomAppBar(
                      horizontalPadding: 0,
                      verticalPadding: 0.sp,
                      isShowbackButton: true,
                      isShowNotification: false,
                    ),
                    verticalGap(10.sp),
                    Expanded(
                      child: ListView.builder(
                        itemCount: languageListController
                            .languageResponse.value!.data.length,
                        itemBuilder: (context, index) {
                          var data = languageListController
                              .languageResponse.value!.data[index];

                          // Check if this item is selected

                          return GestureDetector(
                            onTap: () {
                              languageSelectionController.selectItem(
                                  index: index,
                                  language: data.name,
                                  code: data.code,
                                  direction: data.direction,
                                  is_default:
                                      data.isDefault); // Select the item
                            },
                            child: Obx(
                              () {
                                bool isSelected = languageSelectionController
                                        .selectedIndex.value ==
                                    index;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10.sp),
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.primaryColor
                                          : AppColors.nuralItemBackgroundColor,
                                    ),
                                    color: AppColors.nuralItemBackgroundColor,
                                  ),
                                  child: Row(
                                    textDirection:
                                        multiLangualDataController.isLTR.value
                                            ? TextDirection.ltr
                                            : TextDirection.rtl,
                                    children: [
                                      Text(
                                        data.name.toString(),
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      // Show success icon if selected
                                      if (isSelected)
                                        SizedBox(
                                          height: 15.sp,
                                          width: 15.sp,
                                          child: SvgPicture.asset(
                                            AppIcon.successIcon,
                                            colorFilter: ColorFilter.mode(
                                                AppColors.primaryColor,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
