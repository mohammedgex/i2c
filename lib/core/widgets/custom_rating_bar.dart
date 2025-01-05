import 'package:flutter/material.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating; // The current rating value (e.g., 4.5)
  final int maxRating; // Maximum number of stars
  final Color filledColor; // Color for filled stars
  final Color unfilledColor; // Color for unfilled stars
  final double iconSize; // Size of the stars/icons

  const CustomRatingBar({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
