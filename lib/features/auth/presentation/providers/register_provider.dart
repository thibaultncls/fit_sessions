import 'package:fit_sessions/core/state/async_state.dart';
import 'package:fit_sessions/features/auth/presentation/providers/role_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterProvider extends StateNotifier<AsyncState> {
  RegisterProvider() : super(const AsyncState.initial());

  Future<void> register(
    String email,
    String password,
    String confirmPassword,
    String username,
    RegisterRole role,
  ) async {
    try {
      state = const AsyncState.loading();

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || username.isEmpty) {
        state = const AsyncState.error('Tous les champs sont requis.');
        return;
      }

      if (confirmPassword != password) {
        state = const AsyncState.error('Les mots de passe ne correspondent pas.');
        return;
      }

      if (password.length < 8) {
        state = const AsyncState.error('Le mot de passe doit contenir au moins 8 caractères.');
        return;
      }

      if (username.length < 3) {
        state = const AsyncState.error("Le nom d'utilisateur doit contenir au moins 3 caractères.");
        return;
      }

      if (!_isValidEmail(email)) {
        state = const AsyncState.error("L'adresse e-mail n'est pas valide.");
        return;
      }

      if (role != RegisterRole.client && role != RegisterRole.coach) {
        state = const AsyncState.error('Veuillez sélectionner un rôle valide.');
        return;
      }

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Here you would normally call your authentication service
      // For this example, we'll just simulate a successful registration
      state = const AsyncState.success(null);
    } catch (e) {
      state = AsyncState.error(e.toString());
    }
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }
}
