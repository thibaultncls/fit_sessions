import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    super.key,
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
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isFocused ? focusBorderColor : borderColor),
              boxShadow: [
                if (isFocused)
                  BoxShadow(
                    color: focusGlowColor,
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
                Icon(icon, size: 20, color: iconColor),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: obscureText,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: hintColor, fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),
                if (suffix != null) suffix!,
                const SizedBox(width: 6),
              ],
            ),
          );
        },
      ),
    );
  }
}
