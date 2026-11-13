import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/theme/app_typography.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_copy_section.dart';
import '../widgets/onboarding_pager_indicator.dart';
import '../widgets/onboarding_phone_mockup.dart';
import '../widgets/onboarding_top_bar.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Bar with eSellerHUB Logo and Skip Button (hidden on 3rd page)
            Obx(() => OnboardingTopBar(showSkip: !controller.isLastPage, onSkip: controller.skip)),

            // 2. Showcase Area with Phone Mockups & Copy
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.items.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  final item = controller.items[index];

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 80.h),
                                // Middle Showcase Illustration
                                OnboardingPhoneMockup(type: item.type, image: item.image),
                                SizedBox(height: 20.h),
                                // Title and Description Text
                                OnboardingCopySection(title: item.title, description: item.description),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // 3. Footer with Centered Pager Indicator & Action
            Container(
              height: 78.h,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h, bottom: 20.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Centered 3-Dot Pager
                  Obx(
                    () => OnboardingPagerIndicator(
                      count: controller.items.length,
                      currentIndex: controller.currentPage.value,
                      onDotTapped: controller.goToPage,
                    ),
                  ),

                  // Splash / Next Button on Right (Figma Node 4306:5888: 46x46 orange circle with chevron)
                  Positioned(
                    right: 0,
                    child: Obx(() {
                      final isLast = controller.isLastPage;
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isLast ? 1.0 : 0.0,
                        child: IgnorePointer(
                          ignoring: !isLast,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: controller.nextPage,
                              borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                              child: Container(
                                width: 46.w,
                                height: 46.h,
                                decoration: BoxDecoration(
                                  color: AppColors.brandOrange,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(color: const Color(0x66FF6B00), blurRadius: 16.r, offset: Offset(0, 6.h)),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
