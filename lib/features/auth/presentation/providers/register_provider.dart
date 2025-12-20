import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/core/state/async_state.dart';
import 'package:fit_sessions/features/auth/domain/use_cases/register.dart';
import 'package:fit_sessions/features/auth/presentation/providers/role_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterProvider extends StateNotifier<AsyncState> {
  final Register _registerUseCase;
  RegisterProvider({required Register registerUseCase})
    : _registerUseCase = registerUseCase,
      super(const AsyncState.initial());

  Future<void> register(
    String email,
    String password,
    String confirmPassword,
    String username,
    RegisterRole role,
  ) async {
    state = const AsyncState.loading();

    // debugPrint('RegisterProvider: register called with email: $email, username: $username, role: $role');

    final result = await _registerUseCase(
      RegisterParams(
        email: email,
        password: password,
        username: username,
        role: role,
        confirmPassword: confirmPassword,
      ),
    );

    result.fold(
      (failure) {
        state = AsyncState.error(failure.message);
      },
      (user) {
        state = const AsyncState.success(null);
      },
    );

    // state = const AsyncState.success(null);
  }
}
