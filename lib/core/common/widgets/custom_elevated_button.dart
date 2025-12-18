import 'package:fit_sessions/core/constants/color.dart';
import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const CustomElevatedButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          foregroundColor: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ).copyWith(overlayColor: WidgetStatePropertyAll(context.primaryColor.withValues(alpha: 0.08))),
        child: child,
      ),
    );
  }
}
