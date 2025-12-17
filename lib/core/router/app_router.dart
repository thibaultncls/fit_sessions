import 'package:auto_route/auto_route.dart';
import 'package:fit_sessions/core/config/di.dart';
import 'package:fit_sessions/core/router/app_router.gr.dart';
import 'package:fit_sessions/core/router/guards/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, guards: [DI.instance<AuthGuard>()], path: '/home'),
    AutoRoute(page: SplashRoute.page, initial: true, path: '/splash'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegistrationRoute.page, path: '/register'),
  ];
}
