import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/features/profile/controller/update_address_controller.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';

class UpdateAddressScreen extends StatelessWidget {
  const UpdateAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateAddressController updateAddressController =
        Get.put(UpdateAddressController());

    return Scaffold(
      body: ColorfulSafeArea(
          color: AppColors.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCustomAppBar(
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    isShowbackButton: true,
                    isShowNotification: false,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Update Address",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "State",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateAddressController.stateController,
                    hint: "State",
                    inputType: TextInputType.text,
                    keyName: "State",
                    maxLines: 10,
                    minLines: 2,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "City",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateAddressController.cityController,
                    hint: "City",
                    inputType: TextInputType.emailAddress,
                    keyName: "City",
                    maxLines: 10,
                    minLines: 2,
                  ),
                  verticalGap(10.sp),
                  GlobalText(
                    text: "Address",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalGap(2.sp),
                  CustomTextField(
                    controller: updateAddressController.addressController,
                    hint: "Address",
                    inputType: TextInputType.emailAddress,
                    keyName: "Address",
                    maxLines: 10,
                    minLines: 2,
                  ),
                  verticalGap(20.sp),
                  GlobalButton(
                    height: 50.sp,
                    width: double.infinity,
                    text: "Save",
                    onTap: () {
                      updateAddressController.updateBio();
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
