import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import 'app_decorations.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.brandOrange,
      scaffoldBackgroundColor: AppColors.canvas,
      fontFamily: AppTypography.fontFamily,
      textTheme: AppTypography.textTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.brandOrange,
        onPrimary: Colors.white,
        secondary: AppColors.ink,
        onSecondary: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.ink,
        error: AppColors.error,
        onError: Colors.white,
        outline: AppColors.borderColor,
      ),

      // App Bar Theme (Clean, canvas integrated)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.canvas,
        foregroundColor: AppColors.ink,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: AppColors.ink, size: 20),
        titleTextStyle: AppTypography.heading3,
      ),

      // Card Theme (22px radius, 1px border, Level 2 elevation)
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDecorations.borderRadiusCard,
          side: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),

      // Form Field & Input Decoration Theme (11px radius, #FAFAF8 fill, #E6E5E1 border)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        border: OutlineInputBorder(
          borderRadius: AppDecorations.borderRadiusInput,
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDecorations.borderRadiusInput,
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDecorations.borderRadiusInput,
          borderSide: const BorderSide(color: AppColors.brandOrange, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDecorations.borderRadiusInput,
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppDecorations.borderRadiusInput,
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        labelStyle: AppTypography.bodyMediumWeight.copyWith(fontSize: 12),
        hintStyle: AppTypography.bodyMuted.copyWith(fontSize: 13),
        errorStyle: const TextStyle(fontFamily: AppTypography.fontFamily, fontSize: 11, color: AppColors.errorText),
      ),

      // Primary Button Theme (Pill shape 999px, brand orange)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandOrange,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: AppTypography.button,
          elevation: 0,
        ),
      ),

      // Secondary Button Theme (Pill shape 999px, white fill, 1px border)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          backgroundColor: Colors.white,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
          side: const BorderSide(color: AppColors.borderColor, width: 1),
          shape: const StadiumBorder(),
          textStyle: AppTypography.button,
        ),
      ),

      // Tertiary Button Theme (Pill shape 999px, text only)
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.brandOrange,
          shape: const StadiumBorder(),
          textStyle: AppTypography.button,
        ),
      ),

      // Switch Theme (binary control matching Figma: #DADAD5 inactive, #FF6B00 active)
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll<Color>(Colors.white),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.brandOrange;
          }
          return AppColors.switchInactive;
        }),
        trackOutlineColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      ),

      // Checkbox Theme (rounded 5px, brand orange on select)
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: AppColors.borderColor, width: 1.5),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.brandOrange;
          }
          return Colors.transparent;
        }),
        checkColor: const WidgetStatePropertyAll<Color>(Colors.white),
      ),

      // Snackbar / Toast Theme (#15171C surface, rounded 13px)
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.ink,
        contentTextStyle: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        behavior: SnackBarBehavior.floating,
      ),

      // Bottom Navigation Theme (active brand orange, inactive muted)
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.brandOrange,
        unselectedItemColor: AppColors.muted,
        selectedLabelStyle: TextStyle(fontFamily: AppTypography.fontFamily, fontSize: 11, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        elevation: 8,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(color: AppColors.borderColor, thickness: 1, space: 1),
    );
  }

  // ---------------------------------------------------------------------------
  // Dark Theme (Elevated Dark Slate with Vibrant Brand Orange Highlights)
  // ---------------------------------------------------------------------------
  static ThemeData get darkTheme {
    const Color darkSurface = Color(0xFF1E222B);
    const Color darkBackground = Color(0xFF121418);
    const Color darkBorder = Color(0xFF2C3038);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.brandOrange,
      scaffoldBackgroundColor: darkBackground,
      fontFamily: AppTypography.fontFamily,
      textTheme: AppTypography.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.brandOrange,
        onPrimary: Colors.white,
        secondary: AppColors.brandLight,
        onSecondary: AppColors.ink,
        surface: darkSurface,
        onSurface: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        outline: darkBorder,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDecorations.borderRadiusCard,
          side: const BorderSide(color: darkBorder, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandOrange,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: AppTypography.button,
          elevation: 0,
        ),
      ),
    );
  }
}
