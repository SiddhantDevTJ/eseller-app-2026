import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_typography.dart';

class UiHelpers {
  UiHelpers._();

  /// Status without interruption feedback toast matching Figma Design System
  static void showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.ink,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 13,
      duration: const Duration(seconds: 3),
      icon: Container(
        margin: const EdgeInsets.only(left: 12),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, size: 15, color: Colors.white),
      ),
      titleText: Text(
        title,
        style: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFD4D4CF),
        ),
      ),
    );
  }

  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.ink,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 13,
      duration: const Duration(seconds: 4),
      icon: Container(
        margin: const EdgeInsets.only(left: 12),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          color: AppColors.error,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.close, size: 15, color: Colors.white),
      ),
      titleText: Text(
        title,
        style: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFD4D4CF),
        ),
      ),
    );
  }

  static void showInfoSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.ink,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 13,
      duration: const Duration(seconds: 3),
      icon: Container(
        margin: const EdgeInsets.only(left: 12),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          color: AppColors.info,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.info_outline, size: 15, color: Colors.white),
      ),
      titleText: Text(
        title,
        style: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFD4D4CF),
        ),
      ),
    );
  }

  static void showLoadingDialog({String message = 'Loading...'}) {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppDecorations.borderRadius16,
              boxShadow: AppDecorations.elevationLevel3,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.brandOrange),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  message,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
