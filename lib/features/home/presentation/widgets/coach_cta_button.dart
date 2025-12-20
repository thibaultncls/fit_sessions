import 'package:flutter/material.dart';

enum CoachCtaStyle { filled, outlined }

class CoachCtaButton extends StatelessWidget {
  const CoachCtaButton({
    super.key,
    required this.label,
    required this.style,
    required this.primary,
    required this.primaryDark,
    required this.isDark,
    required this.onPressed,
  });

  final String label;
  final CoachCtaStyle style;
  final Color primary;
  final Color primaryDark;
  final bool isDark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);

    if (style == CoachCtaStyle.outlined) {
      return SizedBox(
        height: 36,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: primary,
            side: BorderSide(color: primary),
            shape: RoundedRectangleBorder(borderRadius: radius),
            padding: const EdgeInsets.symmetric(horizontal: 14),
          ),
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
        ),
      );
    }

    return SizedBox(
      height: 36,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: radius),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ).copyWith(overlayColor: WidgetStatePropertyAll(Colors.white.withValues(alpha: 0.08))),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
      ),
    );
  }
}
