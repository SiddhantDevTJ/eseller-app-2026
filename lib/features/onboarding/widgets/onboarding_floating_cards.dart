import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/theme/app_typography.dart';

class MonthlyBuyersCard extends StatelessWidget {
  const MonthlyBuyersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.6, -0.8),
          end: Alignment(0.6, 0.8),
          colors: [
            Color(0xFF0F285A),
            Color(0xFF0D1A34),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDecorations.radius20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.28),
            blurRadius: 32.r,
            offset: Offset(0, 16.h),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Overlapping Avatars
          SizedBox(
            width: 76.w,
            height: 34.h,
            child: Stack(
              children: [
                _buildAvatar('RK', AppColors.brandOrange, 0),
                _buildAvatar('NG', const Color(0xFF3B9EF5), 20.w),
                _buildAvatar('AS', const Color(0xFF34D399), 40.w),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          // Metric Text
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5,00,000+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  fontFamily: AppTypography.fontFamily,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Software buyers every month',
                style: TextStyle(
                  color: const Color(0xFFD4D4CF),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String label, Color color, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 32.r,
        height: 32.r,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF0D1A34),
            width: 2.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            fontFamily: AppTypography.fontFamily,
          ),
        ),
      ),
    );
  }
}

class NewOpportunityCard extends StatelessWidget {
  const NewOpportunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306.w,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.6, -0.8),
          end: Alignment(0.6, 0.8),
          colors: [
            Color(0xFF0F285A),
            Color(0xFF0D1A34),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDecorations.radius24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.28),
            blurRadius: 32.r,
            offset: Offset(0, 16.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Chip
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6.r,
                  height: 6.r,
                  decoration: const BoxDecoration(
                    color: Color(0xFF34D399),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  'New opportunity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Buyer Row
          Row(
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: const BoxDecoration(
                  color: AppColors.brandOrange,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  'SS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sumanta Sarkar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTypography.fontFamily,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 13.sp,
                          color: const Color(0xFFD4D4CF),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Chennai',
                          style: TextStyle(
                            color: const Color(0xFFD4D4CF),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Call Action Button with Double Pulse Glow Rings
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: AppColors.brandOrange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.brandOrange.withValues(alpha: 0.28),
                      spreadRadius: 3.r,
                    ),
                    BoxShadow(
                      color: AppColors.brandOrange.withValues(alpha: 0.14),
                      spreadRadius: 6.r,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.phone_in_talk,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DecisionMakersCard extends StatelessWidget {
  const DecisionMakersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.6, -0.8),
          end: Alignment(0.6, 0.8),
          colors: [
            Color(0xFF0F285A),
            Color(0xFF0D1A34),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDecorations.radius20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.28),
            blurRadius: 32.r,
            offset: Offset(0, 16.h),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Overlapping Avatars (4 avatars)
          SizedBox(
            width: 96.w,
            height: 34.h,
            child: Stack(
              children: [
                _buildAvatar('AG', AppColors.brandOrange, 0),
                _buildAvatar('VV', const Color(0xFF3B9EF5), 20.w),
                _buildAvatar('SS', const Color(0xFF34D399), 40.w),
                _buildAvatar('+2', const Color(0xFF2A3A5C), 60.w),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          // Decision Maker Texts
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5 decision makers',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                  fontFamily: AppTypography.fontFamily,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Reach by email or LinkedIn',
                style: TextStyle(
                  color: const Color(0xFFD4D4CF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String label, Color color, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 32.r,
        height: 32.r,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF0D1A34),
            width: 2.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            fontFamily: AppTypography.fontFamily,
          ),
        ),
      ),
    );
  }
}
