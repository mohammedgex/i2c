import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/profile/view/bio_update_screen.dart';
import 'package:skill_grow/features/profile/view/update_address_screen.dart';
import 'package:skill_grow/features/profile/view/update_password_screen.dart';
import 'package:skill_grow/features/profile/view/update_profile_screen.dart';
import 'package:skill_grow/features/profile/view/update_social_link_screen.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class EditOptionButtonListView extends StatelessWidget {
  const EditOptionButtonListView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: multiLangualDataController.isLTR.value
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                MyCustomAppBar(
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  isShowbackButton: true,
                  isShowNotification: false,
                ),
                verticalGap(10.sp),
                GlobalText(
                  text: "Edit Options",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                verticalGap(10.sp),
                _buildNavigationButton(
                  icon: Icons.person_2_outlined,
                  label: 'Update Profile',
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                ),
                _buildNavigationButton(
                  icon: Icons.description_outlined,
                  label: 'Update Bio',
                  onPressed: () => Get.to(() => BioUpdateScreen()),
                ),
                _buildNavigationButton(
                  icon: Icons.password_outlined,
                  label: 'Update Password',
                  onPressed: () => Get.to(() => UpdatePasswordScreen()),
                ),
                _buildNavigationButton(
                  icon: Icons.maps_home_work_outlined,
                  label: 'Update Address',
                  onPressed: () => Get.to(() => UpdateAddressScreen()),
                ),
                _buildNavigationButton(
                  icon: Icons.link,
                  label: 'Update Social Links',
                  onPressed: () => Get.to(() => UpdateSocialLinkScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Bounceable(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.sp),
        decoration: BoxDecoration(
          color: AppColors.nuralItemBackgroundColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        // elevation: 0.1,
        child: ListTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: GlobalText(
            text: label,
            softWrap: true,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
        ),
      ),
    );
  }
}
