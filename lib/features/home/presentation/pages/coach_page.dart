import 'dart:ui';

import 'package:fit_sessions/core/common/widgets/bottom_nav.dart';
import 'package:fit_sessions/core/constants/color.dart';
import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:fit_sessions/features/home/presentation/widgets/avatar_button.dart';
import 'package:fit_sessions/features/home/presentation/widgets/coach_card.dart';
import 'package:fit_sessions/features/home/presentation/widgets/coach_cta_button.dart';
import 'package:fit_sessions/features/home/presentation/widgets/notif_button.dart';
import 'package:fit_sessions/features/home/presentation/widgets/search_filter_header.dart';
import 'package:flutter/material.dart';

class CoachPage extends StatefulWidget {
  const CoachPage({super.key});

  @override
  State<CoachPage> createState() => _CoachPageState();
}

class _CoachPageState extends State<CoachPage> {
  final _searchCtrl = TextEditingController();
  int _selectedTab = 0;
  int _selectedChip = 0;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final topBarBg = (isDark ? const Color(0xFF101722) : Colors.white).withValues(alpha: 0.95);
    final divider = isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF3F4F6);

    final titleColor = context.textColor;
    final muted = context.secondaryTextColor;

    final coaches = <CoachCardData>[
      CoachCardData(
        name: 'Alex Durand',
        specialty: 'Hypertrophie • Perte de poids',
        price: 35,
        priceAccent: true,
        availableNow: true,
        availabilityText: 'Disponible maintenant',
        isOnline: true,
        durationMinutes: 45,
        rating: 4.9,
        ctaLabel: 'Réserver',
        ctaStyle: CoachCtaStyle.filled,
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCFqd0r6pBrOVavASJZamRyCs8fXwd5eby1Z2LiuCfQej4BU4mQK8htFaherTyINEwVunvZtRkb57qM6tmwisIWNmNLSutFr66jr5P4Gkrfg6gdsihFuiOFErsPFfp9Zq791GyaDGdZ3JfEJiGYp-TLRviMN4BL1sQW2gGl-XB5x_KWN5reOAOlyTCbrFpYSB7G0DPBIltAPxw0ZkKzwmZwUeXppfy8nSgBM8uG71kovNCojDfj45vCh0eCfP5flkZ3fVUsuKjgaF8J',
      ),
      CoachCardData(
        name: 'Marie Laurent',
        specialty: 'Yoga • Méditation',
        price: 45,
        priceAccent: false,
        availableNow: false,
        availabilityText: 'Prochaine dispo : Mar 18:30',
        location: 'Paris 11',
        durationMinutes: 60,
        rating: 5.0,
        ctaLabel: 'Voir profil',
        ctaStyle: CoachCtaStyle.outlined,
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDTXhSr5yG8MH2RCD4PTLX9Lu40e3EUpoS34RK2dqV1np8oV2UBxwjb2463ITko_3r-NJWEhNaV7SVoAaBoqX_WXAHyCHKoWZZ4LSP6ALKiJqZmXQ40kD3y2-Bth1wcvW86FpcMT1ftMr_J53XCdMS6WXt5P1Vq7fUSv7R-M7wPcXjt2Nu8Tklex-ni7Zez98fO9SQWogoCyEuMjFUdG1fLJSBAbQ4HRgQTVp8y6nHqBHhf460rxmfSBQFFs2-9uJ-vJAWU1rYk_eVg',
      ),
      CoachCardData(
        name: 'Thomas Moreau',
        specialty: 'CrossFit • Endurance',
        price: 30,
        priceAccent: false,
        availableNow: true,
        availabilityText: 'Disponible maintenant',
        location: 'Lyon 03',
        durationMinutes: 30,
        rating: null,
        ctaLabel: 'Réserver',
        ctaStyle: CoachCtaStyle.filled,
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDV2xiEXjuA-XYhaIvUpl-DccGQRjWqylDddd8U_ErMtwBLP42-hBo_oyO4Fv4ISCOipmlejfEhMwmOcwCMMRypksqwyntY-APiG_ZKxEevVkvY8NC5aY3Eh18_ReerXmedxlOnoJToeJoTa6OGb8ZYZiZebOUJozaeGifMbNyGHKbFmpWkOuOM_CcynKqzGrEw3Ic1msrCNRZpGYL-Fk6Hp8XmcUB3jOGf2MH8U9uMJet1qWiMwk9-IrrnyXvoby9i8ijVljbPrPq5',
      ),
    ];

    return Scaffold(
      backgroundColor: context.surfaceColor,
      body: SafeArea(
        top: false, // on simule le spacer "h-12"
        child: CustomScrollView(
          slivers: [
            // Top App Bar (sticky)
            SliverAppBar(
              pinned: true,
              floating: false,
              elevation: 0,
              backgroundColor: topBarBg,
              toolbarHeight: 88,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const SizedBox.expand(),
                ),
              ),
              titleSpacing: 16,
              title: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: context.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: isDark ? 0.0 : 0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.fitness_center, size: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'FitSessions',
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
              actions: [
                NotifButton(isDark: isDark, muted: muted, divider: divider),
                const SizedBox(width: 10),
                AvatarButton(
                  isDark: isDark,
                  borderColor: isDark ? Colors.white.withValues(alpha: 0.10) : const Color(0xFFF3F4F6),
                  avatarUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA6ojZ1B32eCK-bpToZv-VSLNLniA15MJdGd3SgTlYt3m2w_QG5nbKMoLo3AD2-NYNoCGNkNcai6dJXrKg-b7CHaCsCZPSwGSVUiLTTeQyBllpYaSEW2XkoDlQYMvjzAiDuSKleC9mjNV5B8CuTS7meyPagUqxRniSCiB-TVWpbqfUFB6k3lZmOSqo1CyZ5m0_8xrBCejl10VdvpFVAQyrqxvmJSoYd7Xf7svOnkLXUA0FPE08iNggbYlNRZVGwgw1dXMeW4vHSOed8',
                ),
                const SizedBox(width: 16),
              ],
            ),

            // Search + filters sticky section
            SliverPersistentHeader(
              pinned: true,
              delegate: SearchFiltersHeader(
                height: 132,
                backgroundColor: context.surfaceColor,
                dividerColor: divider,
                isDark: isDark,
                muted: muted,
                titleColor: titleColor,
                controller: _searchCtrl,
                selectedChip: _selectedChip,
                onChipTap: (i) => setState(() => _selectedChip = i),
              ),
            ),

            // Content
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 88), // bottom space for nav
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Section header
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommandés pour vous',
                          style: TextStyle(color: titleColor, fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: context.primaryColor),
                          child: const Text('Voir tout', style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),

                  // Cards
                  for (final c in coaches) ...[
                    CoachCard(
                      data: c,
                      primary: context.primaryColor,
                      primaryDark: context.primaryColor,
                      textMain: context.textColor,
                      textMuted: context.secondaryTextColor,
                      divider: divider,
                      accentGreen: AppColors.success,
                      accentGreenBg: AppColors.success.withValues(alpha: 0.10),
                      isDark: isDark,
                      onTap: () {},
                      onCtaPressed: () {},
                    ),
                    const SizedBox(height: 16),
                  ],
                ]),
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation (fixed)
      bottomNavigationBar: BottomNav(
        isDark: isDark,
        divider: divider,
        selectedIndex: _selectedTab,
        onChanged: (i) => setState(() => _selectedTab = i),
      ),
    );
  }
}
