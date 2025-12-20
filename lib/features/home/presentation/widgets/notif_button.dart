import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class NotifButton extends StatelessWidget {
  const NotifButton({super.key, required this.isDark, required this.muted, required this.divider});
  final bool isDark;
  final Color muted;
  final Color divider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: context.textColor, size: 24),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              isDark ? Colors.white.withValues(alpha: 0.0) : Colors.transparent,
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: isDark ? const Color(0xFF101722) : Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
