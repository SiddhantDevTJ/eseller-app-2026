import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/theme/app_typography.dart';
import '../models/onboarding_item.dart';
import 'onboarding_floating_cards.dart';

class OnboardingPhoneMockup extends StatelessWidget {
  final OnboardingType type;

  const OnboardingPhoneMockup({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Phone Mockup Dimensions matching Figma 242.8px × 400px (ScreenUtil responsive)
    final double phoneWidth = 243.0.w;
    final double phoneHeight = 400.0.h;
    final double chassisRadius = 41.8.r;
    final double screenRadius = 33.8.r;

    return Center(
      child: SizedBox(
        width: 320.w,
        height: 420.h,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            // 1. Phone Chassis
            Container(
              width: phoneWidth,
              height: phoneHeight,
              padding: EdgeInsets.all(8.0.r),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A), // Dark phone chassis
                borderRadius: BorderRadius.circular(chassisRadius),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(15, 23, 41, 0.18),
                    blurRadius: 48.r,
                    offset: Offset(0, 24.h),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenRadius),
                child: Stack(
                  children: [
                    // Inner Screen Content
                    Positioned.fill(
                      child: _buildInnerScreen(type),
                    ),

                    // Top Mini Status Bar
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 34.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 10.h),
                            child: Text(
                              '9:41',
                              style: TextStyle(
                                color: AppColors.ink,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppTypography.fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Dynamic Island
                    Positioned(
                      top: 8.h,
                      left: (phoneWidth - 16.w - 72.w) / 2,
                      child: Container(
                        width: 72.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),

                    // Bottom Fade Gradient Overlay (fades gracefully into background)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 120.h,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withValues(alpha: 0.0),
                                Colors.white.withValues(alpha: 0.75),
                                Colors.white,
                              ],
                              stops: const [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Floating Signature Highlight Card
            Positioned(
              top: type == OnboardingType.decisionMakers ? 210.h : 190.h,
              child: _buildFloatingCard(type),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingCard(OnboardingType type) {
    switch (type) {
      case OnboardingType.reachBuyers:
        return const MonthlyBuyersCard();
      case OnboardingType.turnOpportunities:
        return const NewOpportunityCard();
      case OnboardingType.decisionMakers:
        return const DecisionMakersCard();
    }
  }

  Widget _buildInnerScreen(OnboardingType type) {
    switch (type) {
      case OnboardingType.reachBuyers:
        return const _DashboardMockupScreen();
      case OnboardingType.turnOpportunities:
        return const _OpportunitiesMockupScreen();
      case OnboardingType.decisionMakers:
        return const _DecisionMakersMockupScreen();
    }
  }
}

// -------------------------------------------------------------
// Slide 1 Inner Screen: Dashboard Screen
// -------------------------------------------------------------
class _DashboardMockupScreen extends StatelessWidget {
  const _DashboardMockupScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF0E6DA),
            Color(0xFFF0E6DA),
            Color(0xFFF6F6F4),
            Color(0xFFF6F6F4),
          ],
          stops: [0.0, 0.17, 0.35, 1.0],
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 36.h, left: 12.w, right: 12.w, bottom: 48.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hey, Urvashi!',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 21.r,
                          height: 21.r,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            size: 12.sp,
                            color: AppColors.ink,
                          ),
                        ),
                        Positioned(
                          right: 2.w,
                          top: 2.h,
                          child: Container(
                            width: 5.r,
                            height: 5.r,
                            decoration: const BoxDecoration(
                              color: AppColors.error,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 21.r,
                      height: 21.r,
                      decoration: const BoxDecoration(
                        color: AppColors.brandOrange,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'TT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppTypography.fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // Period Filter Toggle
            Container(
              padding: EdgeInsets.all(2.5.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(20, 23, 28, 0.05),
                    blurRadius: 7,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _periodTab('Last 7 Days', isActive: true),
                  _periodTab('Last 30 Days'),
                  _periodTab('Last 90 Days'),
                  _periodTab('Custom', icon: Icons.calendar_today_outlined),
                ],
              ),
            ),
            SizedBox(height: 7.h),

            // Plan Toggle
            Row(
              children: [
                Container(
                  width: 23.w,
                  height: 13.h,
                  decoration: BoxDecoration(
                    color: AppColors.switchInactive,
                    borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Container(
                    width: 9.r,
                    height: 9.r,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  'Show data for current plan only',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // Product Performance Card
            Container(
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(107, 79, 53, 0.1),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Performance',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppTypography.fontFamily,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                          border: Border.all(color: AppColors.borderColor, width: 0.6.w),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'All Products',
                              style: TextStyle(
                                color: AppColors.ink,
                                fontSize: 7.5.sp,
                                fontFamily: AppTypography.fontFamily,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down, size: 8.sp, color: AppColors.ink),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Mini Graph Simulation
                  SizedBox(
                    height: 52.h,
                    child: Stack(
                      children: [
                        // Grid lines
                        Positioned(
                          top: 12.h,
                          left: 0,
                          right: 0,
                          child: Container(height: 0.5.h, color: const Color(0xFFECECE8)),
                        ),
                        Positioned(
                          top: 32.h,
                          left: 0,
                          right: 0,
                          child: Container(height: 0.5.h, color: const Color(0xFFECECE8)),
                        ),
                        // Chart Area Curve
                        CustomPaint(
                          size: Size(200.w, 48.h),
                          painter: _MockChartPainter(),
                        ),
                        // Peak tooltip
                        Positioned(
                          top: 6.h,
                          left: 100.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                            ),
                            child: Text(
                              '4,551 · 10 Oct',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 6.5.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppTypography.fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Metric Tiles
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Expanded(
                        child: _metricTile(
                          title: 'Impressions',
                          value: '30,712',
                          subtext: 'Peak 4,551 / day',
                          dotColor: AppColors.brandOrange,
                          bgColor: const Color(0xFFFFF7F2),
                          borderColor: AppColors.brandOrange.withValues(alpha: 0.2),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: _metricTile(
                          title: 'Total clicks',
                          value: '540',
                          subtext: 'Peak 70 / day',
                          dotColor: AppColors.info,
                          bgColor: AppColors.infoLight,
                          borderColor: AppColors.info.withValues(alpha: 0.2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            // KPI Cards Stack
            Row(
              children: [
                Expanded(
                  child: _kpiCard(
                    title: 'Opportunities',
                    badge: '+280%',
                    value: '19',
                    unit: 'leads',
                    comparison: 'vs. 5 previous 30 days',
                  ),
                ),
                SizedBox(width: 7.w),
                Expanded(
                  child: _kpiCard(
                    title: 'Demo requests',
                    badge: '+275%',
                    value: '15',
                    unit: 'requests',
                    comparison: 'vs. 4 previous 30 days',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _periodTab(String title, {bool isActive = false, IconData? icon}) {
    return Expanded(
      child: Container(
        height: 22.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.brandOrange : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 7.sp, color: AppColors.muted),
              SizedBox(width: 2.w),
            ],
            Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.white : AppColors.muted,
                fontSize: 6.8.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                fontFamily: AppTypography.fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricTile({
    required String title,
    required String value,
    required String subtext,
    required Color dotColor,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      padding: EdgeInsets.all(7.r),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: borderColor, width: 0.6.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 4.r, height: 4.r, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
              SizedBox(width: 3.w),
              Text(
                title,
                style: TextStyle(color: AppColors.muted, fontSize: 7.5.sp, fontFamily: AppTypography.fontFamily),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Text(
            value,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppTypography.fontFamily,
            ),
          ),
          Text(
            subtext,
            style: TextStyle(color: dotColor, fontSize: 6.8.sp, fontFamily: AppTypography.fontFamily),
          ),
        ],
      ),
    );
  }

  Widget _kpiCard({
    required String title,
    required String badge,
    required String value,
    required String unit,
    required String comparison,
  }) {
    return Container(
      padding: EdgeInsets.all(9.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(20, 23, 28, 0.05),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 8.5.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppTypography.fontFamily,
            ),
          ),
          SizedBox(height: 3.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
            ),
            child: Text(
              badge,
              style: TextStyle(
                color: AppColors.success,
                fontSize: 7.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AppTypography.fontFamily,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                unit,
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 8.sp,
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
            ],
          ),
          Text(
            comparison,
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 6.8.sp,
              fontFamily: AppTypography.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// Slide 2 Inner Screen: Opportunities Screen
// -------------------------------------------------------------
class _OpportunitiesMockupScreen extends StatelessWidget {
  const _OpportunitiesMockupScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFF3E5),
            Color(0xFFFFF3E5),
            Color(0xFFF6F6F4),
            Color(0xFFF6F6F4),
          ],
          stops: [0.0, 0.23, 0.46, 1.0],
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 36.h, left: 12.w, right: 12.w, bottom: 48.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Opportunities',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppTypography.fontFamily,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.bolt, size: 8.sp, color: const Color(0xFFC2410C)),
                        SizedBox(width: 2.w),
                        Text(
                          'Updated just now',
                          style: TextStyle(
                            color: const Color(0xFFC2410C),
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 21.r,
                  height: 21.r,
                  decoration: const BoxDecoration(
                    color: AppColors.brandOrange,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'TT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // Search Bar
            Container(
              height: 26.h,
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(20, 23, 28, 0.05),
                    blurRadius: 14,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 10.sp, color: AppColors.muted),
                  SizedBox(width: 6.w),
                  Text(
                    'Search by Product Name',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 8.sp,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            // Filter Chips
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.tune, size: 7.sp, color: Colors.white),
                      SizedBox(width: 3.w),
                      Text(
                        'Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppTypography.fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                    border: Border.all(color: AppColors.borderColor, width: 0.6.w),
                  ),
                  child: Text(
                    'Hot Leads (12)',
                    style: TextStyle(color: AppColors.ink, fontSize: 7.sp, fontFamily: AppTypography.fontFamily),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // Opportunity Lead Card
            Container(
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(20, 23, 28, 0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Opportunity Action',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 7.sp,
                          fontFamily: AppTypography.fontFamily,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppColors.successLight,
                          borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                        ),
                        child: Text(
                          'Connected',
                          style: TextStyle(
                            color: AppColors.success,
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Sumanta Sarkar',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                  Text(
                    'Textile & Garment Manufacturing · Chennai',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 7.5.sp,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: AppColors.brandLight,
                            borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Intelligence',
                            style: TextStyle(
                              color: const Color(0xFFC2410C),
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Container(
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: AppColors.brandOrange,
                            borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Call',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ],
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

// -------------------------------------------------------------
// Slide 3 Inner Screen: Decision Makers Screen
// -------------------------------------------------------------
class _DecisionMakersMockupScreen extends StatelessWidget {
  const _DecisionMakersMockupScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFF3E5),
            Color(0xFFFFF3E5),
            Color(0xFFF6F6F4),
            Color(0xFFF6F6F4),
          ],
          stops: [0.0, 0.10, 0.20, 1.0],
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 36.h, left: 12.w, right: 12.w, bottom: 48.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 20.r,
                  height: 20.r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 8.sp,
                    color: AppColors.ink,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  'Opportunity Intelligence',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // Tabs Bar
            Row(
              children: [
                _tabItem('Overview'),
                SizedBox(width: 3.w),
                _tabItem('Journey'),
                SizedBox(width: 3.w),
                _tabItem('Decision Makers', isActive: true),
              ],
            ),
            SizedBox(height: 8.h),

            // Top Decision Makers Card
            Container(
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(20, 23, 28, 0.05),
                    blurRadius: 7,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Decision Makers',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 9.5.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                  SizedBox(height: 7.h),

                  // Person 1: Aditya Ghosh
                  Row(
                    children: [
                      Container(
                        width: 16.r,
                        height: 16.r,
                        decoration: const BoxDecoration(
                          color: AppColors.brandLight,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: const Color(0xFFC2410C),
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aditya Ghosh',
                              style: TextStyle(
                                color: AppColors.ink,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppTypography.fontFamily,
                              ),
                            ),
                            Text(
                              'Lead Product Manager',
                              style: TextStyle(
                                color: AppColors.muted,
                                fontSize: 7.sp,
                                fontFamily: AppTypography.fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 16.r,
                        height: 16.r,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.email_outlined, size: 8.sp, color: AppColors.muted),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Company Details
                  _companyInfoRow(Icons.language, 'Website', 'wintrustltd.com'),
                  SizedBox(height: 5.h),
                  _companyInfoRow(Icons.business, 'Industry', 'Pharmaceuticals'),
                  SizedBox(height: 5.h),
                  _companyInfoRow(Icons.people_outline, 'Company size', '0-10'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String title, {bool isActive = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.ink : Colors.white,
        borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
        border: isActive ? null : Border.all(color: AppColors.borderColor, width: 0.6.w),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : AppColors.ink,
          fontSize: 7.sp,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          fontFamily: AppTypography.fontFamily,
        ),
      ),
    );
  }

  Widget _companyInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 8.sp, color: AppColors.muted),
        SizedBox(width: 4.w),
        Text(
          '$label: ',
          style: TextStyle(color: AppColors.muted, fontSize: 7.sp, fontFamily: AppTypography.fontFamily),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 7.5.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppTypography.fontFamily,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// -------------------------------------------------------------
// Custom painter for mini smooth spline curve in dashboard chart
// -------------------------------------------------------------
class _MockChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final areaPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x33FF6B00),
          Color(0x00FF6B00),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = AppColors.brandOrange
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.8)
      ..cubicTo(size.width * 0.25, size.height * 0.75, size.width * 0.35, size.height * 0.45, size.width * 0.55, size.height * 0.2)
      ..cubicTo(size.width * 0.7, size.height * 0.05, size.width * 0.85, size.height * 0.6, size.width, size.height * 0.4);

    final areaPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(areaPath, areaPaint);
    canvas.drawPath(path, linePaint);

    // Peak dot
    final peakPoint = Offset(size.width * 0.55, size.height * 0.2);
    canvas.drawCircle(peakPoint, 3.5, Paint()..color = const Color(0x66FF6B00));
    canvas.drawCircle(peakPoint, 2, Paint()..color = AppColors.brandOrange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
