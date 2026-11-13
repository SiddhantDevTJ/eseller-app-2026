import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class EsellerhubLogo extends StatelessWidget {
  final double? height;

  const EsellerhubLogo({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double resolvedHeight = height ?? 40.h;

    return SizedBox(
      height: resolvedHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Brand Emblem
          Container(
            width: resolvedHeight * 0.85,
            height: resolvedHeight * 0.85,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFF7A1A),
                  AppColors.brandOrange,
                ],
              ),
              borderRadius: BorderRadius.circular(resolvedHeight * 0.22),
              boxShadow: [
                BoxShadow(
                  color: AppColors.brandOrange.withValues(alpha: 0.28),
                  blurRadius: 8.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'e',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (resolvedHeight * 0.52),
                      fontWeight: FontWeight.w900,
                      fontFamily: AppTypography.fontFamily,
                      height: 1.0,
                    ),
                  ),
                  Positioned(
                    right: 2.w,
                    top: 2.h,
                    child: Container(
                      width: resolvedHeight * 0.14,
                      height: resolvedHeight * 0.14,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          // Wordmark
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'eSeller',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: (resolvedHeight * 0.48),
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
                TextSpan(
                  text: 'HUB',
                  style: TextStyle(
                    color: AppColors.brandOrange,
                    fontSize: (resolvedHeight * 0.48),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.2,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
