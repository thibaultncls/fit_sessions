import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: context.primaryColor.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.fitness_center, size: 30, color: context.primaryColor),
        ),
        const SizedBox(height: 12),
        Text(
          'FitSessions',
          style: TextStyle(
            color: context.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
