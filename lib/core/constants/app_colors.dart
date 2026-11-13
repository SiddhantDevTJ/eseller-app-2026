import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// --brand-500: Single high-energy brand orange
  static const Color brandOrange = Color(0xFFFF6B00);

  /// --ink-900: Deep primary text, titles and icons
  static const Color ink = Color(0xFF15171C);

  /// --ink-500: Subdued secondary text, captions and hints
  static const Color muted = Color(0xFF75756F);

  /// --surface-100: App background canvas
  static const Color canvas = Color(0xFFF6F6F4);

  /// --surface-warm: Warm accent surface canvas
  static const Color warmCanvas = Color(0xFFF0E6DA);

  /// --border: Structural and divider border lines
  static const Color borderColor = Color(0xFFE6E5E1);

  /// --success-600: Verified and success feedback
  static const Color success = Color(0xFF15803D);

  /// --info-600: Operational informational alerts and links
  static const Color info = Color(0xFF1D6FB8);

  // ---------------------------------------------------------------------------
  // 2. Tints, Feedback & Surface Extensions
  // ---------------------------------------------------------------------------

  /// Soft brand peach tint for container backgrounds and tags
  static const Color brandLight = Color(0xFFFFF1E6);

  /// Soft success green tint
  static const Color successLight = Color(0xFFE9F8EF);

  /// Soft info blue tint
  static const Color infoLight = Color(0xFFF3F9FF);

  /// Error & critical alerts
  static const Color error = Color(0xFFEF4444);

  /// Critical red text for form validation
  static const Color errorText = Color(0xFFDC2626);

  /// Soft error red tint
  static const Color errorLight = Color(0xFFFEE2E2);

  /// Pure card & dialog surface
  static const Color surface = Colors.white;

  /// Input background & subtle card surface
  static const Color surfaceVariant = Color(0xFFFAFAF8);

  /// Control track for segmented buttons
  static const Color trackBackground = Color(0xFFF3F3F0);

  /// Switch inactive track
  static const Color switchInactive = Color(0xFFDADAD5);

  /// Shimmer loading animation base & highlight
  static const Color shimmerBase = Color(0xFFEAEAE6);
  static const Color shimmerHighlight = Color(0xFFF6F6F4);

  // ---------------------------------------------------------------------------
  // 3. Backward Compatibility Aliases
  // ---------------------------------------------------------------------------

  /// Primary theme brand color
  static const Color primary = brandOrange;
  static const Color primaryLight = Color(0xFFFF8533);
  static const Color primaryDark = Color(0xFFCC5500);
  static const Color accent = brandOrange;

  /// Legacy text aliases
  static const Color textPrimary = ink;
  static const Color textSecondary = muted;
  static const Color textDisabled = Color(0xFFA3A39E);
  static const Color textOnPrimary = Colors.white;

  /// Legacy surface aliases
  static const Color background = canvas;
  static const Color divider = borderColor;
  static const Color border = borderColor;
  static const Color darkGray = Color(0xFF2C2F36);
  static const Color warning = Color(0xFFF7B500);

  // Plan tiers
  static const Color planGreen = Color(0xFF2CBFA1);
  static const Color planBlue = Color(0xFF2468FF);
  static const Color planOrange = brandOrange;
  static const Color planYellow = Color(0xFFF7B502);
}
