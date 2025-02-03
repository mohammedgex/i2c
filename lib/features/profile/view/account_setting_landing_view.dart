import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';

import '../controller/image_picker_controller.dart';

class AccountSettingLandingView extends StatelessWidget {
  final Map<String, dynamic> userData = {
    "id": 1000,
    "name": "Jhon Doe",
    "email": "student@gmail.com",
    "phone": "",
    "age": 0,
    "image": "/uploads/website-images/frontend-avatar.png",
    "job_title": "Software Developer",
    "short_bio": "Passionate coder and problem solver.",
    "bio": "Love to create innovative solutions using modern technologies.",
    "gender": "Male",
    "country_id": 0,
    "state": "California",
    "city": "Los Angeles",
    "address": "123 Tech Street",
    "facebook": "",
    "twitter": "",
    "linkedin": "https://linkedin.com/in/johndoe",
    "website": "https://johndoe.com",
    "github": "https://github.com/johndoe"
  };
final ImagePickerController imagePickerController = Get.put(ImagePickerController());
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
              textDirection: multiLangualDataController.isLTR.value ? TextDirection.ltr : TextDirection.rtl,
              children: [
                SizedBox(height: 20),
                 GestureDetector(
                  onTap: () => imagePickerController.pickImage(),
                  child: Obx(() => Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: imagePickerController.profileImage.value != null
                            ? FileImage(imagePickerController.profileImage.value!)
                            : NetworkImage(ApiEndpoint.imageUrl + userData["image"])
                                as ImageProvider,
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
                          child: Icon(Icons.edit, 
                            color: Colors.white, 
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(height: 12),
                Text(
                  userData["name"],
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  userData["job_title"] ?? "Not Provided",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        _buildInfoRow(Icons.email, "Email", userData["email"]),
                        _buildInfoRow(Icons.phone, "Phone",
                            userData["phone"] ?? "Not Provided"),
                        _buildInfoRow(Icons.location_city, "Location",
                            "${userData["city"]}, ${userData["state"]}"),
                        _buildInfoRow(
                            Icons.cake, "Age", userData["age"].toString()),
                        SizedBox(height: 16),
                        Text(
                          "About Me",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userData["bio"] ?? "No bio available.",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 16),
                        Wrap(
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
        children: [
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title: $value",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSocialLinks() {
    List<Map<String, dynamic>> socialLinks = [
      {"icon": Icons.web, "url": userData["website"]},
      {"icon": Icons.link, "url": userData["linkedin"]},
      {"icon": Icons.code, "url": userData["github"]},
    ];
    return socialLinks
        .where((link) => link["url"].isNotEmpty)
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
