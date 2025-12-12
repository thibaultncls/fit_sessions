import 'package:firebase_core/firebase_core.dart';
import 'package:fit_sessions/core/config/theme.dart';
import 'package:fit_sessions/core/router/app_router.dart';
import 'package:fit_sessions/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
