import 'package:flutter/material.dart';

/// Global static color palette for the FitSessions app.
/// Clean, modern, consistent with Material You and your brand identity.
class AppColors {
  AppColors._(); // Prevent instantiation

  // -----------------------------
  // BRAND / PRIMARY
  // -----------------------------
  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primaryLight = Color(0xFF93C5FD);
  static const Color primarySoft = Color(0xFFDBEAFE);

  // -----------------------------
  // NEUTRALS / BACKGROUNDS / TEXT
  // -----------------------------
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F7);
  static const Color card = Color(0xFFFAFAFA);
  static const Color divider = Color(0xFFE5E5E7);

  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);

  // -----------------------------
  // STATES (SUCCESS / WARNING / ERROR)
  // -----------------------------
  static const Color success = Color(0xFF22C55E);
  static const Color successDark = Color(0xFF15803D);

  static const Color warning = Color(0xFFF97316);
  static const Color warningDark = Color(0xFFC2410C);

  static const Color error = Color(0xFFEF4444);
  static const Color errorDark = Color(0xFFB91C1C);

  // -----------------------------
  // TAG COLORS (OPTIONAL)
  // -----------------------------
  static const Color tagStrength = Color(0xFF6366F1); // violet
  static const Color tagCardio = Color(0xFF06B6D4); // cyan
  static const Color tagWeightLoss = Color(0xFF06B6D4);
  static const Color tagBulk = Color(0xFF10B981); // green

  // -----------------------------
  // OPTIONAL DARK THEME SUPPORT
  // (Useful for Material 3 dynamic theming later)
  // -----------------------------
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF1C1C1E);
  static const Color darkCard = Color(0xFF2C2C2E);

  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
}
