// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/features/payment/model/payment_url_model.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentErrorResponseModel errorData =
        Get.arguments as PaymentErrorResponseModel;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 80, color: Colors.red),
              SizedBox(height: 20),
              Text(
                errorData.message, // ✅ API Error Message
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              if (errorData.supportCurrency != null) ...[
                SizedBox(height: 10),
                Text(
                  errorData.supportCurrency,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: 30),
              GlobalButton(
                width: 200.sp,
                height: 40.sp,
                onTap: () => Get.back(), // Go Back to Previous Page
                text: "Go Back",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
