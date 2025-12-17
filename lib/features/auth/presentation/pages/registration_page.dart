import 'package:auto_route/auto_route.dart';
import 'package:fit_sessions/core/constants/color.dart';
import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:fit_sessions/features/auth/presentation/widgets/auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Assume you already have:
// - context.surfaceColor / context.primaryColor / context.textColor / etc.
// - AppColors.surface
// - AuthInput widget (exactly as you shared)

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _firstNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Providers définis dans build comme ton exemple (ça marche, mais c'est pas idéal)
    final showPasswordProvider = StateProvider<bool>((ref) => true);
    final showConfirmPasswordProvider = StateProvider<bool>((ref) => true);

    return Scaffold(
      backgroundColor: context.surfaceColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        // Logo Header (comme AuthPage)
                        Column(
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
                        ),

                        const SizedBox(height: 28),

                        // Headlines
                        Text(
                          'Créer un compte',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: context.textColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Commence ton parcours fitness',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: context.secondaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Form fields (labels + AuthInput)
                        _LabeledField(
                          label: 'Prénom',
                          child: AuthInput(
                            surface: context.surfaceColor,
                            borderColor: context.secondaryColor.withValues(alpha: 0.40),
                            focusBorderColor: context.secondaryColor.withValues(alpha: 0.50),
                            focusGlowColor: context.primaryColor.withValues(alpha: 0.20),
                            icon: Icons.person_outline,
                            iconColor: context.tertiaryTextColor,
                            hint: 'Jean',
                            controller: _firstNameCtrl,
                            keyboardType: TextInputType.name,
                            textColor: context.textColor,
                            hintColor: context.tertiaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 16),

                        _LabeledField(
                          label: 'Email',
                          child: AuthInput(
                            surface: context.surfaceColor,
                            borderColor: context.secondaryColor.withValues(alpha: 0.40),
                            focusBorderColor: context.secondaryColor.withValues(alpha: 0.50),
                            focusGlowColor: context.primaryColor.withValues(alpha: 0.20),
                            icon: Icons.mail_outline,
                            iconColor: context.tertiaryTextColor,
                            hint: 'jean.dupont@exemple.com',
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            textColor: context.textColor,
                            hintColor: context.tertiaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 16),

                        _LabeledField(
                          label: 'Mot de passe',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer(
                                builder: (context, ref, child) {
                                  final showPassword = ref.watch(showPasswordProvider);
                                  return AuthInput(
                                    surface: context.surfaceColor,
                                    borderColor: context.secondaryColor.withValues(alpha: 0.40),
                                    focusBorderColor: context.secondaryColor.withValues(alpha: 0.50),
                                    focusGlowColor: context.primaryColor.withValues(alpha: 0.20),
                                    icon: Icons.lock_outline,
                                    iconColor: context.tertiaryTextColor,
                                    hint: '••••••••',
                                    controller: _passwordCtrl,
                                    obscureText: showPassword,
                                    textColor: context.textColor,
                                    hintColor: context.tertiaryTextColor,
                                    suffix: IconButton(
                                      onPressed: () =>
                                          ref.read(showPasswordProvider.notifier).state = !showPassword,
                                      icon: Icon(
                                        showPassword ? Icons.visibility : Icons.visibility_off,
                                        size: 20,
                                        color: context.tertiaryTextColor,
                                      ),
                                      splashRadius: 22,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  'Minimum 8 caractères',
                                  style: TextStyle(
                                    color: context.secondaryTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        _LabeledField(
                          label: 'Confirmation du mot de passe',
                          child: Consumer(
                            builder: (context, ref, child) {
                              final showConfirm = ref.watch(showConfirmPasswordProvider);
                              return AuthInput(
                                surface: context.surfaceColor,
                                borderColor: context.secondaryColor.withValues(alpha: 0.40),
                                focusBorderColor: context.secondaryColor.withValues(alpha: 0.50),
                                focusGlowColor: context.primaryColor.withValues(alpha: 0.20),
                                icon: Icons.lock_outline,
                                iconColor: context.tertiaryTextColor,
                                hint: '••••••••',
                                controller: _confirmPasswordCtrl,
                                obscureText: showConfirm,
                                textColor: context.textColor,
                                hintColor: context.tertiaryTextColor,
                                suffix: IconButton(
                                  onPressed: () =>
                                      ref.read(showConfirmPasswordProvider.notifier).state = !showConfirm,
                                  icon: Icon(
                                    showConfirm ? Icons.visibility : Icons.visibility_off,
                                    size: 20,
                                    color: context.tertiaryTextColor,
                                  ),
                                  splashRadius: 22,
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Primary button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: submit registration
                            },
                            style:
                                ElevatedButton.styleFrom(
                                  backgroundColor: context.primaryColor,
                                  foregroundColor: AppColors.surface,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ).copyWith(
                                  overlayColor: WidgetStatePropertyAll(
                                    context.primaryColor.withValues(alpha: 0.08),
                                  ),
                                ),
                            child: const Text(
                              'Créer mon compte',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Footer (HTML: "Déjà un compte ? Se connecter")
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: context.secondaryTextColor, fontSize: 13),
                  children: [
                    const TextSpan(text: 'Déjà un compte ? '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {
                          context.router.replacePath('/login');
                        },
                        child: Text(
                          'Se connecter',
                          style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6, bottom: 8),
          child: Text(
            label,
            style: TextStyle(color: context.textColor, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
        child,
      ],
    );
  }
}
