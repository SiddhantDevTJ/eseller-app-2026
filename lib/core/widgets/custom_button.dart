import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_typography.dart';

/// Three priorities defined in the Figma Design System
enum ButtonVariant {
  primary,
  secondary,
  tertiary,

  /// Backward-compatible alias for secondary
  outline,
}

/// Three sizes defined in the Figma Design System
enum ButtonSize {
  /// Height: 48px, horizontal padding: 21px
  large,

  /// Height: 38px, horizontal padding: 16px
  medium,

  /// Height: 32px, horizontal padding: 13px
  small,
}

/// Production-ready Button component implementing the eSellerHUB Figma Design System
/// ("Three priorities, three sizes, consistent 48px touch targets.")
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final ButtonVariant variant;
  final ButtonSize size;
  final IconData? icon;
  final Widget? iconWidget;
  final bool isTrailingIcon;
  final double? height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.large,
    this.icon,
    this.iconWidget,
    this.isTrailingIcon = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double resolvedHeight = height ?? _getHeight(size);
    final EdgeInsets padding = _getPadding(size);

    final effectiveVariant = variant == ButtonVariant.outline ? ButtonVariant.secondary : variant;
    final bool isEnabled = onPressed != null && !isLoading;

    // Content: text + optional icon + loading spinner
    final Widget labelWidget = Text(
      label,
      style: AppTypography.button.copyWith(
        color: _getTextColor(effectiveVariant, isEnabled),
        fontSize: size == ButtonSize.small ? 12 : 13,
      ),
    );

    final Widget? iconElement = iconWidget ??
        (icon != null
            ? Icon(
                icon,
                size: size == ButtonSize.small ? 15 : 18,
                color: _getTextColor(effectiveVariant, isEnabled),
              )
            : null);

    Widget contentChild;
    if (isLoading) {
      contentChild = SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            effectiveVariant == ButtonVariant.primary ? Colors.white : AppColors.brandOrange,
          ),
        ),
      );
    } else {
      contentChild = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconElement != null && !isTrailingIcon) ...[
            iconElement,
            const SizedBox(width: 7),
          ],
          labelWidget,
          if (iconElement != null && isTrailingIcon) ...[
            const SizedBox(width: 7),
            iconElement,
          ],
        ],
      );
    }

    // Container with pill shape (999px) and brand shadow
    Widget button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
        child: Ink(
          height: resolvedHeight,
          padding: padding,
          decoration: BoxDecoration(
            color: _getBackgroundColor(effectiveVariant, isEnabled),
            borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
            border: _getBorder(effectiveVariant, isEnabled),
            boxShadow: (effectiveVariant == ButtonVariant.primary && isEnabled)
                ? AppDecorations.brandButtonGlow
                : null,
          ),
          child: Center(
            widthFactor: isFullWidth ? null : 1.0,
            child: contentChild,
          ),
        ),
      ),
    );

    // Ensure accessible touch target (min 48px) even when height is 38 or 32
    if (resolvedHeight < 48) {
      button = ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: Center(child: button),
      );
    }

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }

  double _getHeight(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return 48.0;
      case ButtonSize.medium:
        return 38.0;
      case ButtonSize.small:
        return 32.0;
    }
  }

  EdgeInsets _getPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 21);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16);
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 13);
    }
  }

  Color _getBackgroundColor(ButtonVariant variant, bool isEnabled) {
    if (!isEnabled) {
      switch (variant) {
        case ButtonVariant.primary:
          return AppColors.brandOrange.withValues(alpha: 0.5);
        case ButtonVariant.secondary:
        case ButtonVariant.outline:
          return Colors.white.withValues(alpha: 0.5);
        case ButtonVariant.tertiary:
          return Colors.transparent;
      }
    }

    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.brandOrange;
      case ButtonVariant.secondary:
      case ButtonVariant.outline:
        return Colors.white;
      case ButtonVariant.tertiary:
        return Colors.transparent;
    }
  }

  Color _getTextColor(ButtonVariant variant, bool isEnabled) {
    if (!isEnabled) {
      return AppColors.muted.withValues(alpha: 0.6);
    }

    switch (variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.secondary:
      case ButtonVariant.outline:
        return AppColors.ink;
      case ButtonVariant.tertiary:
        return AppColors.brandOrange;
    }
  }

  Border? _getBorder(ButtonVariant variant, bool isEnabled) {
    if (variant == ButtonVariant.secondary || variant == ButtonVariant.outline) {
      return Border.all(
        color: isEnabled ? AppColors.borderColor : AppColors.borderColor.withValues(alpha: 0.5),
        width: 1,
      );
    }
    return null;
  }
}

// -----------------------------------------------------------------------------
// Icon Button Component (38x38 Circular Actions)
// -----------------------------------------------------------------------------

enum IconButtonVariant {
  /// White surface with Level 1 drop shadow
  elevated,

  /// White surface with 1px border
  outlined,

  /// Solid Ink-900 background with white icon
  dark,

  /// Soft grey background with muted icon
  muted,
}

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final IconButtonVariant variant;
  final bool hasBadge;
  final Color? badgeColor;
  final double size;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.variant = IconButtonVariant.outlined,
    this.hasBadge = false,
    this.badgeColor,
    this.size = 38.0,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Border? border;
    List<BoxShadow>? shadows;

    switch (variant) {
      case IconButtonVariant.elevated:
        bg = Colors.white;
        shadows = AppDecorations.elevationLevel1;
        break;
      case IconButtonVariant.outlined:
        bg = Colors.white;
        border = Border.all(color: AppColors.borderColor, width: 1);
        break;
      case IconButtonVariant.dark:
        bg = AppColors.ink;
        shadows = AppDecorations.elevationLevel1;
        break;
      case IconButtonVariant.muted:
        bg = const Color(0xFFECECE9);
        break;
    }

    return SizedBox(
      width: 48,
      height: 48,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(AppDecorations.radiusFull),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Ink(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: bg,
                    border: border,
                    boxShadow: shadows,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: icon),
                ),
                if (hasBadge)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: badgeColor ?? AppColors.error,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
