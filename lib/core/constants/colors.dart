import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  /// Background Gradient Colors
  static const Color backgroundGradientStart = Color(0xFF151413);
  static const Color backgroundGradientEnd = Color(0xFF0A0908);

  /// Card & Border Colors
  static Color cardBackground = const Color(0xFFFFFFFF).withValues(alpha: 0.06);
  static Color cardBorder = const Color(0xFFFFFFFF).withValues(alpha: 0.05);

  /// Branding & Accent Colors
  static const Color accentYellow = Color(0xFFF3C11B);
  static const Color primaryGreen = Color(0xFF1C873B);

  /// Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9E9E);
}
