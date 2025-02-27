import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goals_app/config/routes/app_routes.dart';
import 'package:goals_app/config/design/tokens.dart';

class GoalsApp extends StatelessWidget {
  const GoalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: Themes.defaultTheme,
      ),
    );
  }
}
