import 'package:auto_route/auto_route.dart';
import 'package:fit_sessions/core/constants/color.dart';
import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:fit_sessions/features/auth/presentation/widgets/auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showPasswordProvider = StateProvider<bool>((ref) => true);

    return Scaffold(
      backgroundColor: context.surfaceColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        // Logo area
                        Column(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: context.primaryColor.withValues(alpha: 0.20),
                                shape: BoxShape.circle,
                                border: Border.all(color: context.primaryColor.withValues(alpha: 0.10)),
                              ),
                              child: Icon(Icons.fitness_center, size: 32, color: context.primaryColor),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'FitSessions',
                              style: TextStyle(
                                color: context.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Headline
                        Text(
                          'Connexion',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: context.textColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Accède à ton espace',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: context.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Form
                        AuthInput(
                          surface: context.surfaceColor,
                          borderColor: context.secondaryColor.withValues(alpha: 0.40),
                          focusBorderColor: context.secondaryColor.withValues(alpha: 0.50),
                          focusGlowColor: context.primaryColor.withValues(alpha: 0.20),
                          icon: Icons.mail,
                          iconColor: context.tertiaryTextColor,
                          hint: 'Email',
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          textColor: context.textColor,
                          hintColor: context.tertiaryTextColor,
                        ),
                        const SizedBox(height: 16),
                        Consumer(
                          builder: (context, ref, child) {
                            final showPassword = ref.watch(showPasswordProvider);
                            return AuthInput(
                              surface: context.surfaceColor,
                              borderColor: context.secondaryColor.withValues(alpha: .4),
                              focusBorderColor: context.secondaryColor.withValues(alpha: 0.50),
                              focusGlowColor: context.primaryColor.withValues(alpha: 0.20),
                              icon: Icons.lock,
                              iconColor: context.tertiaryTextColor,
                              hint: 'Mot de passe',
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

                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: forgot password
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: context.primaryColor,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            ),
                            child: const Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: submit
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Se connecter',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward, size: 20),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Divider with text
                        const SizedBox(height: 16),

                        // Social buttons (placeholder icons)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Bottom action
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: context.secondaryTextColor, fontSize: 13),
                  children: [
                    const TextSpan(text: 'Pas encore de compte ? '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {
                          context.router.replacePath('/register');
                        },
                        child: Text(
                          'Créer un compte',
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
