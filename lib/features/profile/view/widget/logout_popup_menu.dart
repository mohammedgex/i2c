import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/profile/controller/log_out_controller.dart';

class LogoutPopupMenu extends StatelessWidget {
  const LogoutPopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());

    return Scaffold(
      body: ColorfulSafeArea(
          color: AppColors.scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
            child: Center(
              child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCustomAppBar(
                      isShowbackButton: true,
                      isShowNotification: false,
                      horizontalPadding: 0,
                      verticalPadding: 0,
                    ),
                    Spacer(),
                    // SizedBox(
                    //   height: 100.sp,
                    //   width: 250.sp,
                    //   child: Image.asset(AppImage.logo),
                    // ),
                    verticalGap(7.sp),
                    GlobalText(
                      text: "Log Out",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    verticalGap(20.sp),
                    GlobalButton(
                        height: 50.sp,
                        width: double.infinity,
                        text: "Logout from this Device",
                        onTap: () {
                          _showLogoutDialog(context, false);
                        }),
                    verticalGap(17.sp),
                    GlobalButton(
                        height: 50.sp,
                        width: double.infinity,
                        text: "Logout from all Device",
                        onTap: () {
                          _showLogoutDialog(context, true);
                        }),
                    Spacer(),
                  ]),
            ),
          )),
    );
  }

  void _showLogoutDialog(BuildContext context, bool isAllDeviceLogout) {
    LogOutController logOutController = Get.put(LogOutController());
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: AlertDialog(
          title: GlobalText(text: "Confirm Logout"),
          content: GlobalText(text: "Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: GlobalText(
                text: ("Cancel"),
              ),
            ),
            TextButton(
              onPressed: () {
                if (isAllDeviceLogout) {
                  logOutController.logoutFromAllDevices();
                  // logout from all device
                } else {
                  logOutController.logOutFromThisDevice();
                  // logout from this device
                }
              },
              child: GlobalText(
                text: "Logout",
                style: TextStyle(
                  color: AppColors.mainRedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
