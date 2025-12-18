import 'dart:ui';

import 'package:fit_sessions/core/common/widgets/custom_elevated_button.dart';
import 'package:fit_sessions/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.title, required this.message, required this.onRetry});

  final String title;
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          // Blur overlay (backdrop-blur-[4px])
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: const SizedBox.shrink(),
            ),
          ),

          // Centered dialog
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 340),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: context.surfaceColor,
                    borderRadius: BorderRadius.circular(20), // rounded-2xl ~ 20px
                    border: Border.all(color: context.surfaceColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.10),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                        spreadRadius: -10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon container
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF7F1D1D).withValues(alpha: 0.20) // red-900/20
                              : const Color(0xFFFEF2F2), // red-50
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.error_outline,
                          size: 32,
                          color: Color(0xFFEF4444), // red-500
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Title + Body
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: context.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: context.secondaryTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.45,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Actions
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onRetry?.call();
                        },
                        child: const Text(
                          'Réessayer',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        height: 48, // gives the "h-11" feel
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style:
                              TextButton.styleFrom(
                                foregroundColor: context.secondaryTextColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              ).copyWith(
                                overlayColor: WidgetStatePropertyAll(
                                  context.primaryColor.withValues(alpha: 0.08),
                                ),
                              ),
                          child: const Text(
                            'Fermer',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
