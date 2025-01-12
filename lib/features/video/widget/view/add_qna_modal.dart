import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/widgets/text_input.dart';

import '../../../../core/constant/constant.dart';

class AddQnaModal extends StatelessWidget {
  const AddQnaModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp), // Customize the radius
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 400.sp, maxWidth: 400.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalText(
              text: "Question",
              softWrap: true,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalGap(10.sp),
            CustomTextField(
              controller: TextEditingController(),
              hint: "Question",
              inputType: TextInputType.text,
            ),
            verticalGap(10.sp),
            GlobalText(
              text: "Description",
              softWrap: true,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalGap(10.sp),
            CustomTextField(
              controller: TextEditingController(),
              hint: "Description",
              inputType: TextInputType.text,
              minLines: 2,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
