import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';

class OnboardingPagerIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final ValueChanged<int>? onDotTapped;

  const OnboardingPagerIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.onDotTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            final bool isActive = index == currentIndex;
            return GestureDetector(
              onTap: onDotTapped != null ? () => onDotTapped!(index) : null,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic,
                  width: isActive ? 32.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.brandOrange : const Color(0xFFD9D8D3),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
