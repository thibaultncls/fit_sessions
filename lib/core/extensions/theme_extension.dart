import 'package:fit_sessions/core/constants/color.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get textColor => Theme.of(this).colorScheme.onSurface;
  Brightness get brightness => Theme.of(this).brightness;
  Color get secondaryTextColor {
    return brightness == Brightness.dark ? AppColors.darkTextSecondary : AppColors.textSecondary;
  }

  Color get tertiaryTextColor => AppColors.textTertiary;

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
