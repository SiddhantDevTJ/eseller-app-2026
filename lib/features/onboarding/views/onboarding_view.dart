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
            // 1. Top Bar with eSellerHUB Logo and Skip Button
            OnboardingTopBar(
              onSkip: controller.skip,
            ),

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
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 8.h),
                                // Phone Mockup with Overlay Card
                                OnboardingPhoneMockup(type: item.type),
                                SizedBox(height: 16.h),
                                // Title and Description Text
                                OnboardingCopySection(
                                  title: item.title,
                                  description: item.description,
                                ),
                                SizedBox(height: 12.h),
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

                  // Next / Get Started Button on Right
                  Positioned(
                    right: 0,
                    child: Obx(
                      () {
                        final isLast = controller.isLastPage;
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: controller.nextPage,
                            borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: EdgeInsets.symmetric(
                                horizontal: isLast ? 14.w : 10.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.brandOrange,
                                borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                                boxShadow: AppDecorations.brandButtonGlow,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (isLast) ...[
                                    Text(
                                      'Get Started',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTypography.fontFamily,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                  ],
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
