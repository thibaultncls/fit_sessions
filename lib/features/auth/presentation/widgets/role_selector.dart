import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:fit_sessions/features/auth/presentation/providers/role_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _roleProvider = StateNotifierProvider<RoleProvider, RegisterRole>((ref) => RoleProvider());

class RoleSelector extends ConsumerWidget {
  const RoleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(_roleProvider);
    return Row(
      children: [
        Expanded(
          child: _RoleCard(
            selected: role == RegisterRole.client,
            icon: Icons.fitness_center,
            title: 'Pratiquant',
            subtitle: 'Je cherche un coach',
            onTap: () => ref.read(_roleProvider.notifier).setRole(RegisterRole.client),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _RoleCard(
            selected: role == RegisterRole.coach,
            icon: Icons.sports,
            title: 'Coach sportif',
            subtitle: 'Je propose des séances',
            onTap: () => ref.read(_roleProvider.notifier).setRole(RegisterRole.coach),
          ),
        ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final border = selected ? context.primaryColor : context.tertiaryTextColor.withValues(alpha: 0.20);
    final bg = selected
        ? (isDark ? context.primaryColor.withValues(alpha: 0.10) : const Color(0xFFEFF6FF)) // blue-50
        : context.surfaceColor;

    final titleColor = selected ? context.primaryColor : context.textColor;
    final iconColor = selected ? context.primaryColor : context.tertiaryTextColor;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border, width: 2),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Stack(
          children: [
            // Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32, color: iconColor),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: titleColor, fontSize: 13, fontWeight: FontWeight.w800, height: 1.1),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.secondaryTextColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ),

            // Check (top-right)
            Positioned(
              top: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 160),
                opacity: selected ? 1 : 0,
                child: Icon(Icons.check_circle, size: 18, color: context.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
