import 'package:flutter/material.dart';

class AppDecorations {
  AppDecorations._();

  /// 16px radius: Small cards and tiles
  static const double radius16 = 16.0;
  static const BorderRadius borderRadius16 = BorderRadius.all(Radius.circular(radius16));

  /// 20px radius: Medium containers and modal sheets
  static const double radius20 = 20.0;
  static const BorderRadius borderRadius20 = BorderRadius.all(Radius.circular(radius20));

  /// 22px radius: Standard design system cards and panel containers
  static const double radiusCard = 22.0;
  static const BorderRadius borderRadiusCard = BorderRadius.all(Radius.circular(radiusCard));

  /// 24px radius: Large feature cards
  static const double radius24 = 24.0;
  static const BorderRadius borderRadius24 = BorderRadius.all(Radius.circular(radius24));

  /// 11px radius: Form text inputs and field containers
  static const double radiusInput = 11.0;
  static const BorderRadius borderRadiusInput = BorderRadius.all(Radius.circular(radiusInput));

  /// Full / Pill radius (999px): Buttons, search inputs, tags, chips and switches
  static const double radiusFull = 999.0;
  static const BorderRadius borderRadiusFull = BorderRadius.all(Radius.circular(radiusFull));

  /// Level 1: Controls & chips (shadow: 0px 5px 10px rgba(20, 23, 28, 0.05))
  static const List<BoxShadow> elevationLevel1 = [
    BoxShadow(color: Color.fromRGBO(20, 23, 28, 0.05), blurRadius: 10, offset: Offset(0, 5)),
  ];

  /// Level 2: Cards & panels (shadow: 0px 10px 28px rgba(107, 79, 53, 0.10))
  static const List<BoxShadow> elevationLevel2 = [
    BoxShadow(color: Color.fromRGBO(107, 79, 53, 0.10), blurRadius: 28, offset: Offset(0, 10)),
  ];

  /// Level 3: Sheets & overlays (shadow: 0px 18px 38px rgba(20, 23, 28, 0.16))
  static const List<BoxShadow> elevationLevel3 = [
    BoxShadow(color: Color.fromRGBO(20, 23, 28, 0.16), blurRadius: 38, offset: Offset(0, 18)),
  ];

  /// Brand Glow: Primary action buttons (shadow: 0px 7px 8px rgba(255, 107, 0, 0.20))
  static const List<BoxShadow> brandButtonGlow = [
    BoxShadow(color: Color.fromRGBO(255, 107, 0, 0.20), blurRadius: 8, offset: Offset(0, 7)),
  ];
}
