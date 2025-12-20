import 'package:flutter/material.dart';

class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({
    super.key,
    required this.availableNow,
    required this.text,
    required this.primary,
    required this.textMuted,
    required this.accentGreen,
    required this.accentGreenBg,
    required this.isDark,
  });

  final bool availableNow;
  final String text;
  final Color primary;
  final Color textMuted;
  final Color accentGreen;
  final Color accentGreenBg;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    if (availableNow) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.30) : accentGreenBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: accentGreen, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: isDark ? const Color(0xFF34D399) : accentGreen,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.10) : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_month, size: 14, color: textMuted),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: textMuted, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
