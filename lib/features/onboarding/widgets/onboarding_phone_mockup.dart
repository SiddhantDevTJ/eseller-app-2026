import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../models/onboarding_item.dart';

class OnboardingPhoneMockup extends StatelessWidget {
  final OnboardingType type;
  final String? image;

  const OnboardingPhoneMockup({super.key, required this.type, this.image});

  String get _imagePath {
    if (image != null && image!.isNotEmpty) return image!;
    switch (type) {
      case OnboardingType.reachBuyers:
        return AppAssets.onboardingImg1;
      case OnboardingType.turnOpportunities:
        return AppAssets.onboardingImg2;
      case OnboardingType.decisionMakers:
        return AppAssets.onboardingImg3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 1.6,
        child: SizedBox(
          width: 340.w,
          height: 310.h,
          child: SvgPicture.asset(_imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
