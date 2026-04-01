import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Gold theme
  static Color primaryColor = Color.fromARGB(255, 188, 143, 7); // Main gold
  static Color primaryColorDark = Color(0xFFB48912); // Darker gold
  static Color primaryColorLight =
      Color.fromARGB(255, 192, 149, 9); // Lighter gold
  static Color secondaryColor = Color(0xFF8B5CF6); // Accent purple (kept)
  static Color accentColor = Color(0xFF06B6D4); // Accent cyan (kept)

  // Gradient Colors
  static List<Color> primaryGradient = [
    Color(0xFFD6AB28), // Gold
    Color(0xFFE7C967), // Light gold
  ];

  static List<Color> secondaryGradient = [
    Color(0xFF8B5CF6), // Purple
    Color(0xFF6366F1), // Indigo
  ];

  // Background Colors - Softer and more eye-friendly
  static Color scaffoldBackgroundColor = Color(0xFFFAFBFC); // Very light gray
  static Color cardBackgroundColor = Color(0xFFFFFFFF);
  static Color nuralItemBackgroundColor = Color(0xFFF7F8FA); // Softer gray

  // Text Colors - Softer and more readable
  static Color onboardingTitleTextColor = Color(0xFF1A1F36); // Softer dark
  static Color titleTextColor = Color(0xFF2D3748); // Softer slate
  static Color smallTextColor = Color(0xFF4A5568); // More readable gray
  static Color appbarTitleTextColor = Color(0xFF1A1F36);
  static Color hintTextColor = Color(0xFFA0AEC0); // Softer hint
  static Color globalButtonTextColor = Color(0xFFFFFFFF);
  static Color onboardingSubtitleTextColor =
      Color(0xFF718096); // Softer subtitle

  // UI Element Colors - Softer borders
  static Color inactiveIconColor = Color(0xFFCBD5E0);
  static Color activeIconColor = Color(0xFFD6AB28);
  static Color textFieldBorderColor = Color(0xFFE8EDF3); // Softer border

  // Status Colors
  static Color mainRedColor = Color(0xFFEF4444); // Modern Red
  static Color secondRedColor = Color(0xFFF87171);
  static Color successColor = Color(0xFF10B981); // Green
  static Color warningColor = Color(0xFFF59E0B); // Amber
  static Color errorColor = Color(0xFFEF4444); // Red
  static Color infoColor = Color(0xFF3B82F6); // Blue

  // Snackbar Colors
  static Color infoSnackBackgroundColor = Color(0xFFDBEAFE);
  static Color infoSnackIconBackgroundColor = Color(0xFF3B82F6);
  static Color successSnackIconBackgroundColor = Color(0xFF10B981);
  static Color successSnackBackgroundColor = Color(0xFFD1FAE5);
  static Color warningSnackBackgroundColor = Color(0xFFFEF3C7);
  static Color warningSnackIconBackgroundColor = Color(0xFFF59E0B);
  static Color failedSnackBackgroundColor = Color(0xFFFEE2E2);
  static Color failedSnackIconBackgroundColor = Color(0xFFEF4444);

  // Loading/Shimmer Colors
  static Color shimmerBackgroundColor = Color(0xFFE2E8F0);
  static Color shimmerHighlightColor = Color(0xFFF1F5F9);

  // Shadow Colors
  static Color shadowColor = Color(0x1A000000);
  static Color shadowColorLight = Color(0x0D000000);
}
