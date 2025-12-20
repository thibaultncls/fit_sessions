import 'package:fit_sessions/features/home/presentation/widgets/availability_badge.dart';
import 'package:fit_sessions/features/home/presentation/widgets/coach_avatar.dart';
import 'package:fit_sessions/features/home/presentation/widgets/coach_cta_button.dart';
import 'package:fit_sessions/features/home/presentation/widgets/meta_item.dart';
import 'package:fit_sessions/features/home/presentation/widgets/separator_dot.dart';
import 'package:flutter/material.dart';

class CoachCard extends StatelessWidget {
  const CoachCard({
    super.key,
    required this.data,
    required this.primary,
    required this.primaryDark,
    required this.textMain,
    required this.textMuted,
    required this.divider,
    required this.accentGreen,
    required this.accentGreenBg,
    required this.isDark,
    required this.onTap,
    required this.onCtaPressed,
  });

  final CoachCardData data;

  final Color primary;
  final Color primaryDark;
  final Color textMain;
  final Color textMuted;
  final Color divider;
  final Color accentGreen;
  final Color accentGreenBg;

  final bool isDark;
  final VoidCallback onTap;
  final VoidCallback onCtaPressed;

  @override
  Widget build(BuildContext context) {
    final cardBg = isDark ? const Color(0xFF1A2230) : Colors.white;
    final border = isDark ? Colors.white.withValues(alpha: 0.05) : Colors.transparent;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                CoachAvatar(
                  avatarUrl: data.avatarUrl,
                  showOnlineDot: data.availableNow,
                  isDark: isDark,
                  accentGreen: accentGreen,
                ),
                const SizedBox(width: 14),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name + price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name,
                                  style: TextStyle(
                                    color: textMain,
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w800,
                                    height: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.specialty,
                                  style: TextStyle(
                                    color: textMuted,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${data.price}€',
                                style: TextStyle(
                                  color: data.priceAccent ? primary : textMain,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                '/ séance',
                                style: TextStyle(
                                  color: textMuted,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // availability badge
                      AvailabilityBadge(
                        availableNow: data.availableNow,
                        text: data.availabilityText,
                        primary: primary,
                        textMuted: textMuted,
                        accentGreen: accentGreen,
                        accentGreenBg: accentGreenBg,
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),
            Container(height: 1, color: divider),
            const SizedBox(height: 12),

            // bottom row (meta + CTA)
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      MetaItem(
                        icon: data.isOnline ? Icons.videocam : Icons.location_on,
                        text: data.isOnline ? 'En ligne' : (data.location ?? 'Sur place'),
                        color: textMuted,
                      ),
                      SeparatorDot(color: isDark ? Colors.white10 : Colors.black12),
                      MetaItem(icon: Icons.schedule, text: '${data.durationMinutes} min', color: textMuted),
                      if (data.rating != null) ...[
                        SeparatorDot(color: isDark ? Colors.white10 : Colors.black12),
                        MetaItem(
                          icon: Icons.star,
                          text: data.rating!.toStringAsFixed(1),
                          color: const Color(0xFFF59E0B), // yellow-ish
                          filledIcon: true,
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                CoachCtaButton(
                  label: data.ctaLabel,
                  style: data.ctaStyle,
                  primary: primary,
                  primaryDark: primaryDark,
                  isDark: isDark,
                  onPressed: onCtaPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoachCardData {
  CoachCardData({
    required this.name,
    required this.specialty,
    required this.price,
    required this.availableNow,
    required this.availabilityText,
    required this.durationMinutes,
    required this.ctaLabel,
    required this.ctaStyle,
    required this.avatarUrl,
    this.location,
    this.isOnline = false,
    this.rating,
    this.priceAccent = false,
  });

  final String name;
  final String specialty;
  final int price;
  final bool availableNow;
  final String availabilityText;

  final bool isOnline;
  final String? location;
  final int durationMinutes;
  final double? rating;

  final String ctaLabel;
  final CoachCtaStyle ctaStyle;

  final String avatarUrl;

  final bool priceAccent;
}
