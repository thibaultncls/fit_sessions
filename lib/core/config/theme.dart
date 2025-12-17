import 'package:fit_sessions/core/constants/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String fontFamily = 'Poppins';

  static final textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      fontFamily: fontFamily,
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      surface: AppColors.card,
      onPrimary: AppColors.surface,
      onSecondary: AppColors.surface,
      onSurface: AppColors.textPrimary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.card,
    dividerColor: AppColors.divider,
    textTheme: textTheme,
    fontFamily: fontFamily,
  );
}
