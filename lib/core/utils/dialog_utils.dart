import 'package:fit_sessions/core/common/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  DialogUtils._();

  static Future<void> showFitSessionsErrorDialog({
    required BuildContext context,
    String title = 'Une erreur est survenue',
    String message = 'Une erreur est survenue. Vérifie ta connexion ou réessaie dans quelques instants.',
    VoidCallback? onRetry,
  }) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'error_dialog',
      barrierColor: Colors.black.withValues(alpha: 0.40), // bg-black/40
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) => ErrorDialog(title: title, message: message, onRetry: onRetry),
      transitionBuilder: (context, anim, secondary, child) {
        final curve = CurvedAnimation(parent: anim, curve: const Cubic(0.16, 1, 0.3, 1));
        return FadeTransition(
          opacity: curve,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1).animate(curve),
            child: SlideTransition(
              position: Tween<Offset>(begin: const Offset(0, 0.02), end: Offset.zero).animate(curve),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
