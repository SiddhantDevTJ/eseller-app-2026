import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Typography tokens strictly mapped from the eSellerHUB Figma Design System
/// Font family: Outfit ("Outfit balances warmth with operational precision")
class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Outfit';

  // ---------------------------------------------------------------------------
  // 1. Core Typography Scale (Figma Specifications)
  // ---------------------------------------------------------------------------

  /// Display: 32 / 38 · Semibold
  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 38 / 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.7,
    color: AppColors.ink,
  );

  /// Heading 1: 24 / 30 · Semibold
  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 30 / 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    color: AppColors.ink,
  );

  /// Heading 2: 20 / 26 · Semibold
  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 26 / 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
    color: AppColors.ink,
  );

  /// Heading 3: 17 / 22 · Medium
  static const TextStyle heading3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 22 / 17,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.2,
    color: AppColors.ink,
  );

  /// Body: 14 / 20 · Regular
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.ink,
  );

  /// Body Medium: 14 / 20 · Medium
  static const TextStyle bodyMediumWeight = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.ink,
  );

  /// Body Muted: 14 / 20 · Regular in muted color
  static const TextStyle bodyMuted = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
  );

  /// Caption: 12 / 15 · Medium (letter-spaced uppercase tags/subtitles)
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 15 / 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.6,
    color: AppColors.muted,
  );

  /// Button / Action Label: 13 / 19.5 · Medium
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    height: 19.5 / 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  /// Small / Form Hint: 11 / 16.5 · Regular
  static const TextStyle small = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 16.5 / 11,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
  );

  // ---------------------------------------------------------------------------
  // 2. Material TextTheme Compatibility Mapping
  // ---------------------------------------------------------------------------

  static const TextStyle displayLarge = display;
  static const TextStyle displayMedium = heading1;
  static const TextStyle displaySmall = heading2;

  static const TextStyle headlineLarge = heading1;
  static const TextStyle headlineMedium = heading2;
  static const TextStyle headlineSmall = heading3;

  static const TextStyle titleLarge = heading2;
  static const TextStyle titleMedium = heading3;
  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 22 / 16,
    fontWeight: FontWeight.w400,
    color: AppColors.ink,
  );

  static const TextStyle bodyMedium = body;
  static const TextStyle bodySmall = small;

  static const TextStyle labelLarge = button;
  static const TextStyle labelMedium = caption;
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    height: 14 / 10,
    fontWeight: FontWeight.w500,
    color: AppColors.muted,
  );

  static TextTheme get textTheme => const TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}
