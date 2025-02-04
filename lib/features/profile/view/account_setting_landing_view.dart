import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';

import '../controller/image_picker_controller.dart';
import 'edit_option_button_list_view.dart';

class AccountSettingLandingView extends StatelessWidget {
  final MultiLangualDataController multiLangualDataController =
      Get.put(MultiLangualDataController());
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  AccountSettingLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              textDirection: multiLangualDataController.isLTR.value
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          AppIcon.arrowBackIcon,
                          width: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => EditOptionButtonListView()),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalGap(20.sp),
                GestureDetector(
                  onTap: () => imagePickerController.pickImage(),
                  child: Obx(() => Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                imagePickerController.profileImage.value != null
                                    ? FileImage(imagePickerController
                                        .profileImage.value!) as ImageProvider
                                    : NetworkImage(ApiEndpoint.imageUrl +
                                        (profileDataCotroller.userDataResponse
                                                .value?.data.image ??
                                            '')) as ImageProvider,
                            backgroundColor: Colors.white,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                verticalGap(12.sp),
                GlobalText(
                  text:
                      profileDataCotroller.userDataResponse.value?.data.name ??
                          'No Name',
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                GlobalText(
                  text: profileDataCotroller
                          .userDataResponse.value?.data.jobTitle ??
                      'No Job Title',
                  softWrap: true,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
                verticalGap(20.sp),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalGap(16.sp),
                        _buildInfoRow(
                            Icons.email,
                            "Email",
                            profileDataCotroller
                                    .userDataResponse.value?.data.email ??
                                'No Email'),
                        _buildInfoRow(
                            Icons.phone,
                            "Phone",
                            profileDataCotroller
                                    .userDataResponse.value?.data.phone ??
                                'No Phone'),
                        _buildInfoRow(Icons.location_city, "Location",
                            "${profileDataCotroller.userDataResponse.value?.data.city ?? 'No City'}, ${profileDataCotroller.userDataResponse.value?.data.state ?? 'No State'}"),
                        _buildInfoRow(
                            Icons.cake,
                            "Age",
                            profileDataCotroller
                                    .userDataResponse.value?.data.age
                                    .toString() ??
                                'No Age'),
                        verticalGap(16.sp),
                        GlobalText(
                          text: "About Me",
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        verticalGap(8.sp),
                        GlobalText(
                          softWrap: true,
                          text: profileDataCotroller
                                  .userDataResponse.value?.data.bio ??
                              'No Bio Available',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                          textAlign: TextAlign.justify,
                        ),
                        verticalGap(16.sp),
                        Wrap(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          spacing: 16,
                          children: _buildSocialLinks(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        children: [
          Icon(icon, color: Colors.blueAccent),
          horizontalGap(10.sp),
          Expanded(
            child: GlobalText(
              softWrap: true,
              text: "$title: $value",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSocialLinks() {
    final userData = profileDataCotroller.userDataResponse.value?.data;
    if (userData == null) return [];

    List<Map<String, dynamic>> socialLinks = [
      {"icon": Icons.web, "url": userData.website},
      {"icon": Icons.link, "url": userData.linkedin},
      {"icon": Icons.code, "url": userData.github},
    ];

    return socialLinks
        .where((link) => link["url"] != null && link["url"].isNotEmpty)
        .map(
          (link) => IconButton(
            icon: Icon(link["icon"], size: 30, color: Colors.blueAccent),
            onPressed: () {
              // Implement URL launch logic
            },
          ),
        )
        .toList();
  }
}
