import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/Global/api_endpoint.dart';
import '../../../../core/icons/app_icon.dart';

class InitialTumbnailUI extends StatelessWidget {
  final String thumbnailImage;
  final VoidCallback wishOntap;
  final VoidCallback playOntap;
  const InitialTumbnailUI(
      {super.key,
      required this.thumbnailImage,
      required this.wishOntap,
      required this.playOntap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Image.network(
            ApiEndpoint.imageUrl + thumbnailImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: const Color.fromARGB(90, 0, 0, 0)),
        ),
        Positioned(
          // alignment: Alignment.topRight,
          right: 10.sp,
          top: 10.sp,
          child: Bounceable(
            onTap: wishOntap,
            child: Container(
              width: 30.sp,
              height: 30.sp,
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(120, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50.sp)),
              child: SvgPicture.asset(
                AppIcon.addwishIcon,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Bounceable(
            onTap: playOntap,
            child: Container(
              width: 50.sp,
              height: 50.sp,
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(120, 0, 0, 0),
                  borderRadius: BorderRadius.circular(50.sp)),
              child: SvgPicture.asset(
                AppIcon.playIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
