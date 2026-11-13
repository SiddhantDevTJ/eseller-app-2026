import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_typography.dart';

/// Segmented control mapped from the eSellerHUB Figma Design System
/// ("Use for 2–4 peer views.")
class AppSegmentedControl<T> extends StatelessWidget {
  final List<T> values;
  final List<String> labels;
  final T selectedValue;
  final ValueChanged<T> onValueChanged;

  const AppSegmentedControl({
    super.key,
    required this.values,
    required this.labels,
    required this.selectedValue,
    required this.onValueChanged,
  }) : assert(values.length == labels.length, 'Values and labels count must match');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.trackBackground,
        borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(values.length, (index) {
          final value = values[index];
          final label = labels[index];
          final bool isSelected = value == selectedValue;

          return Expanded(
            child: GestureDetector(
              onTap: () => onValueChanged(value),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                height: 34,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.brandOrange : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
                  boxShadow: isSelected
                      ? const [
                          BoxShadow(
                            color: Color.fromRGBO(255, 107, 0, 0.22),
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 11,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : AppColors.muted,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

