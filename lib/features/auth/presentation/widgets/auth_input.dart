import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
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
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
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
