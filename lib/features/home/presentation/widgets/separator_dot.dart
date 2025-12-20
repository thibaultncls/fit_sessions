import 'package:flutter/material.dart';

class SeparatorDot extends StatelessWidget {
  const SeparatorDot({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 12, color: color);
  }
}
