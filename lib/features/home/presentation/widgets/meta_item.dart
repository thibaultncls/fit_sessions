import 'package:flutter/material.dart';

class MetaItem extends StatelessWidget {
  const MetaItem({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.filledIcon = false,
  });

  final IconData icon;
  final String text;
  final Color color;
  final bool filledIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
