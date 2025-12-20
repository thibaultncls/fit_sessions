import 'package:flutter/material.dart';

class CoachAvatar extends StatelessWidget {
  const CoachAvatar({
    super.key,
    required this.avatarUrl,
    required this.showOnlineDot,
    required this.isDark,
    required this.accentGreen,
  });

  final String avatarUrl;
  final bool showOnlineDot;
  final bool isDark;
  final Color accentGreen;

  @override
  Widget build(BuildContext context) {
    final dotBorder = isDark ? const Color(0xFF1A2230) : Colors.white;

    return Stack(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFF3F4F6),
            image: DecorationImage(image: NetworkImage(avatarUrl), fit: BoxFit.cover),
          ),
        ),
        if (showOnlineDot)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: accentGreen,
                shape: BoxShape.circle,
                border: Border.all(color: dotBorder, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
