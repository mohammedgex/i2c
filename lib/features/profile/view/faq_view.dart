import 'package:accordion/accordion.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/profile/controller/faq_controller.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    FAQController faqController = Get.put(FAQController());
    return Scaffold(
      body: Obx(() {
        if (faqController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ColorfulSafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyCustomAppBar(
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      isShowbackButton: true,
                    ),
                    verticalGap(10.sp),
                    GlobalText(
                      text: "FAQs",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                    Accordion(
                        paddingListTop: 10.sp,
                        disableScrolling: true,
                        contentBorderColor: AppColors.primaryColor,
                        children: List.generate(
                            faqController.faqResponse.value!.data.length,
                            (index) {
                          var faq = faqController.faqResponse.value!.data[0];
                          return AccordionSection(
                            headerBackgroundColor: AppColors.primaryColor,
                            headerPadding: EdgeInsets.all(10.sp),
                            rightIcon: Container(
                              padding: EdgeInsets.all(3.sp),
                              height: 20.sp,
                              width: 20.sp,
                              child: SvgPicture.asset(AppIcon.arrowDownIcon,
                                  color: Colors.white),
                            ),
                            header: GlobalText(
                              text: faq.question,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.white),
                            ),
                            content: GlobalText(
                              text: faq.answer,
                              softWrap: true,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          );
                        }))
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
