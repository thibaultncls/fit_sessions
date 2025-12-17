import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fit_sessions/core/router/app_router.gr.dart';
import 'package:fit_sessions/core/use_case/use_case.dart';
import 'package:fit_sessions/features/auth/domain/use_cases/is_signed_in.dart';

class AuthGuard extends AutoRouteGuard {
  final IsSignedIn _isSignedIn;

  AuthGuard({required IsSignedIn isSignedIn}) : _isSignedIn = isSignedIn;

  @override
  FutureOr<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final result = await _isSignedIn(NoParams());

    result.fold(
      (failure) {
        // In case of failure, we consider the user as not authenticated
        router.replace(LoginRoute());
      },
      (isSignedIn) {
        if (isSignedIn) {
          resolver.next(true);
        } else {
          router.replace(LoginRoute());
        }
      },
    );
  }
}
