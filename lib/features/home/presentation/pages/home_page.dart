import 'package:auto_route/auto_route.dart';
import 'package:fit_sessions/features/home/presentation/pages/coach_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CoachPage();
  }
}
