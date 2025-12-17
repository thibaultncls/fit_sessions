import 'package:auto_route/annotations.dart';
import 'package:fit_sessions/core/constants/color.dart';
import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                        _InputField(
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
                            return _InputField(
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
                          // TODO: go to signup
                        },
                        child: Text(
                          'Créer un compte',
                          style: TextStyle(color: context.textColor, fontWeight: FontWeight.w800),
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

class _InputField extends StatefulWidget {
  const _InputField({
    required this.surface,
    required this.borderColor,
    required this.focusBorderColor,
    required this.focusGlowColor,
    required this.icon,
    required this.iconColor,
    required this.hint,
    required this.controller,
    required this.textColor,
    required this.hintColor,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
  });

  final Color surface;
  final Color borderColor;
  final Color focusBorderColor;
  final Color focusGlowColor;

  final IconData icon;
  final Color iconColor;

  final String hint;
  final TextEditingController controller;
  final Color textColor;
  final Color hintColor;

  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffix;

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  late final FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focus.hasFocus;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: widget.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isFocused ? widget.focusBorderColor : widget.borderColor),
        boxShadow: [
          if (isFocused)
            BoxShadow(
              color: widget.focusGlowColor,
              blurRadius: 16,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            )
          else
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Icon(widget.icon, size: 20, color: widget.iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              focusNode: _focus,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              style: TextStyle(color: widget.textColor, fontWeight: FontWeight.w600, fontSize: 16),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(color: widget.hintColor, fontWeight: FontWeight.w500),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
          if (widget.suffix != null) widget.suffix!,
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}
