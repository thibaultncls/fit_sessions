import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.isDark,
    required this.divider,
    required this.selectedIndex,
    required this.onChanged,
  });

  final bool isDark;
  final Color divider;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const primary = Color(0xFF3B82F6);

  @override
  Widget build(BuildContext context) {
    final bg = (isDark ? const Color(0xFF101722) : Colors.white).withValues(alpha: 0.95);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: bg,
            border: Border(top: BorderSide(color: divider)),
          ),
          child: Row(
            children: [
              _NavItem(
                icon: Icons.explore,
                label: 'Découvrir',
                selected: selectedIndex == 0,
                onTap: () => onChanged(0),
                filled: true,
              ),
              _NavItem(
                icon: Icons.calendar_month,
                label: 'Réservations',
                selected: selectedIndex == 1,
                onTap: () => onChanged(1),
              ),
              _NavItem(
                icon: Icons.chat_bubble,
                label: 'Messages',
                selected: selectedIndex == 2,
                onTap: () => onChanged(2),
              ),
              _NavItem(
                icon: Icons.person,
                label: 'Profil',
                selected: selectedIndex == 3,
                onTap: () => onChanged(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.filled = false,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool filled;

  static const primary = Color(0xFF3B82F6);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final muted = isDark ? Colors.grey.shade400 : const Color(0xFF6B7280);
    final active = primary;
    final color = selected ? active : muted;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: color),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
