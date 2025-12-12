import 'package:firebase_core/firebase_core.dart';
import 'package:fit_sessions/core/config/theme.dart';
import 'package:fit_sessions/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
