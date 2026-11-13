import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/theme/app_typography.dart';
import 'esellerhub_logo.dart';

class OnboardingTopBar extends StatelessWidget {
  final VoidCallback onSkip;

  const OnboardingTopBar({
    super.key,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EsellerhubLogo(height: 38.h),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onSkip,
              borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
              child: Container(
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F6F3),
                  borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
