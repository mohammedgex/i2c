import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/mulit_langual_data/controller/multi_langual_data_controller.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating; // The current rating value (e.g., 4.5)
  final int maxRating; // Maximum number of stars
  final Color filledColor; // Color for filled stars
  final Color unfilledColor; // Color for unfilled stars
  final double iconSize; // Size of the stars/icons

   CustomRatingBar({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.iconSize = 24.0,
  });
  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: multiLangualDataController.isLTR.value
          ? TextDirection.ltr
          : TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        // Determine the star type (filled, half-filled, or unfilled)
        if (index < rating.floor()) {
          // Fully filled star
          return Icon(
            Icons.star,
            color: filledColor,
            size: iconSize,
          );
        } else if (index < rating) {
          // Half-filled star
          return Icon(
            Icons.star_half,
            color: filledColor,
            size: iconSize,
          );
        } else {
          // Unfilled star
          return Icon(
            Icons.star_border,
            color: unfilledColor,
            size: iconSize,
          );
        }
      }),
    );
  }
}
