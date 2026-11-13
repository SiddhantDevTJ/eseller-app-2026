import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/secure_storage_service.dart';
import '../../../routes/app_routes.dart';
import '../models/onboarding_item.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  List<OnboardingItem> get items => OnboardingItem.items;

  bool get isLastPage => currentPage.value == items.length - 1;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      pageController.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeInOutCubic);
    }
  }

  void goToPage(int index) {
    if (index >= 0 && index < items.length) {
      pageController.animateToPage(index, duration: const Duration(milliseconds: 350), curve: Curves.easeInOutCubic);
    }
  }

  Future<void> skip() async {
    await completeOnboarding();
  }

  Future<void> completeOnboarding() async {
    try {
      if (Get.isRegistered<SecureStorageService>()) {
        // await SecureStorageService.to.setFirstLaunchComplete();
      }
    } catch (_) {}

    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
