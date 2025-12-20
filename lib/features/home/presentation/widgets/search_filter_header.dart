import 'package:fit_sessions/features/home/presentation/widgets/chip_button.dart';
import 'package:flutter/material.dart';

class SearchFiltersHeader extends SliverPersistentHeaderDelegate {
  SearchFiltersHeader({
    required this.height,
    required this.backgroundColor,
    required this.dividerColor,
    required this.isDark,
    required this.muted,
    required this.titleColor,
    required this.controller,
    required this.selectedChip,
    required this.onChipTap,
  });

  final double height;
  final Color backgroundColor;
  final Color dividerColor;
  final bool isDark;
  final Color muted;
  final Color titleColor;
  final TextEditingController controller;

  final int selectedChip;
  final ValueChanged<int> onChipTap;

  static const primary = Color(0xFF3B82F6);
  static const backgroundSubtle = Color(0xFFF3F4F6);

  final _chips = const ['Tout', 'Disponible maintenant', 'Cette semaine', '≤ 30€', 'Débutant'];

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bg = backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bg,
        border: Border(bottom: BorderSide(color: dividerColor)),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          // search
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Stack(
              children: [
                TextField(
                  controller: controller,
                  style: TextStyle(color: titleColor, fontWeight: FontWeight.w600, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Rechercher un coach...',
                    hintStyle: TextStyle(color: muted, fontWeight: FontWeight.w500),
                    prefixIcon: Icon(Icons.search, color: muted),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.tune, color: muted),
                    ),
                    filled: true,
                    fillColor: isDark ? Colors.white.withValues(alpha: 0.05) : backgroundSubtle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  ),
                ),
              ],
            ),
          ),

          // chips
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                final selected = i == selectedChip;
                return ChipButton(label: _chips[i], selected: selected, onTap: () => onChipTap(i));
              },
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemCount: _chips.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SearchFiltersHeader oldDelegate) {
    return oldDelegate.selectedChip != selectedChip ||
        oldDelegate.isDark != isDark ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
