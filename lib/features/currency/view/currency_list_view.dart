import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/features/currency/controller/currency_list_controller.dart';
import 'package:skill_grow/features/currency/controller/selected_currency_controller.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/widgets/appbar.dart';

class CurrencyListView extends StatelessWidget {
  const CurrencyListView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    CurrencyListController currencyListController =
        Get.put(CurrencyListController());
    SelectedCurrencyController selectedCurrencyController =
        Get.put(SelectedCurrencyController());

    return Obx(
      () {
        if (currencyListController.isLoading.value) {
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
                        itemCount: currencyListController
                            .languageResponse.value!.data.length,
                        itemBuilder: (context, index) {
                          var data = currencyListController
                              .languageResponse.value!.data[index];

                          // Check if this item is selected

                          return GestureDetector(
                            onTap: () {
                              selectedCurrencyController.selectItem(
                                  index: index,
                                  currency_icon: data.currencyIcon.toString(),
                                  currency_name: data.currencyName.toString(),
                                  currency_code: data.currencyCode.toString(),
                                  currency_rate: data.currencyRate.toString(),
                                  currency_position:
                                      data.currencyPosition.toString(),
                                  status: data.status.toString() ,
                                  is_default: data.isDefault.toString(),

                                 ); // Select the item
                            },
                            child: Obx(
                              () {
                                bool isSelected = selectedCurrencyController
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
                                        data.currencyName.toString(),
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
