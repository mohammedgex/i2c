import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/features/profile/controller/courntry_list_controller.dart';
import 'package:skill_grow/features/profile/controller/update_address_controller.dart';
import 'package:skill_grow/features/profile/model/country_list_model.dart';
import 'package:skill_grow/widgets/dropdown_input.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/texts.dart';

class UpdateAddressScreen extends StatelessWidget {
  const UpdateAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CourntryListController countryListController =
        Get.put(CourntryListController());
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
                    softWrap: false,
                    text: 'Country',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  verticalGap(5.sp),
                  Obx(() {
                    if (countryListController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      // Get the list of countries
                      final countries =
                          countryListController.countryList.value!.data;

                      final initialCountry = countries.firstWhere(
                        (country) =>
                            country.id == updateAddressController.countryId,
                        orElse: () => CountryListModel(
                            id: 0,
                            name:
                                ''), // Fallback to the first country if not found
                      );

                      // Ensure the selectedName is updated with the initial country name
                      if (updateAddressController
                          .countryController.selectedValue.value.isEmpty) {
                        updateAddressController.countryController.selectedValue
                            .value = initialCountry.name;
                      }

                      return CustomDropDownField(
                        title: "All Country",
                        items:
                            countries.map((country) => country.name).toList(),
                        // Pre-selected country name
                        onItemSelected: (value) {
                          if (value != null) {
                            // Find the selected country object
                            final selectedCountry = countries.firstWhere(
                              (country) => country.name == value,
                            );

                            // Update both the selected country ID and name in the controller
                            updateAddressController.countryId =
                                selectedCountry.id;
                            updateAddressController.countryController
                                .selectedValue.value = selectedCountry.name;

                            print(updateAddressController.countryId);
                          }
                        },
                        controller: updateAddressController.countryController,
                      );
                    }
                  }),
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
                  Obx(
                    () {
                      if (updateAddressController.isLoading.value) {
                        return SizedBox(
                          height: 50.sp,
                          width: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return GlobalButton(
                          height: 50.sp,
                          width: double.infinity,
                          text: "Save",
                          onTap: () {
                            updateAddressController.updateAddress();
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
