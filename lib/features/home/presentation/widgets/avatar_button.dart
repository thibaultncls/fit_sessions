import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  const AvatarButton({super.key, required this.isDark, required this.borderColor, required this.avatarUrl});

  final bool isDark;
  final Color borderColor;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.0 : 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        image: DecorationImage(image: NetworkImage(avatarUrl), fit: BoxFit.cover),
      ),
    );
  }
}
