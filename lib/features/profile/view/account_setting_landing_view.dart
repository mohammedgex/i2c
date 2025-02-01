import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';

class AccountSettingLandingView extends StatelessWidget {
  const AccountSettingLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileDataCotroller profileDataCotroller = Get.find();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Obx(() {
        if (profileDataCotroller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ColorfulSafeArea(
            bottom: false,
            color: AppColors.scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom AppBar
                  MyCustomAppBar(
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    isShowbackButton: true,
                  ),
                  verticalGap(10.h),

                  // Title
                  Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  verticalGap(20.h),

                  // User Profile Section
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Profile Picture
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: NetworkImage(ApiEndpoint.imageUrl +
                              profileDataCotroller
                                  .userDataResponse.value!.data.image
                                  .toString()),
                        ),
                        horizontalGap(16.w),

                        // User Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileDataCotroller
                                  .userDataResponse.value!.data.name
                                  .toString(),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            verticalGap(4.h),
                            Text(
                              profileDataCotroller
                                  .userDataResponse.value!.data.email
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalGap(20.h),

                  // Settings Options
                  Expanded(
                    child: ListView(
                      children: [
                        _buildSettingOption(
                          icon: Icons.person_outline,
                          title: "Edit Profile",
                          onTap: () {
                            // Navigate to Edit Profile Screen
                          },
                        ),
                        _buildSettingOption(
                          icon: Icons.lock_outline,
                          title: "Change Password",
                          onTap: () {
                            // Navigate to Change Password Screen
                          },
                        ),
                        _buildSettingOption(
                          icon: Icons.notifications_none_outlined,
                          title: "Notification Settings",
                          onTap: () {
                            // Navigate to Notification Settings Screen
                          },
                        ),
                        _buildSettingOption(
                          icon: Icons.private_connectivity,
                          title: "Privacy Settings",
                          onTap: () {
                            // Navigate to Privacy Settings Screen
                          },
                        ),
                        _buildSettingOption(
                          icon: Icons.help_outline,
                          title: "Help & Support",
                          onTap: () {
                            // Navigate to Help & Support Screen
                          },
                        ),
                        _buildSettingOption(
                          icon: Icons.logout,
                          title: "Logout",
                          onTap: () {
                            // Handle Logout
                          },
                          isLogout: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  // Setting Option Widget
  Widget _buildSettingOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 24.sp,
          color: isLogout ? AppColors.mainRedColor : AppColors.primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isLogout ? AppColors.mainRedColor : AppColors.primaryColor,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
