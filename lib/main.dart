import 'package:cutap/config/router/rutas.dart';
import 'package:cutap/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cup-Tap',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
       theme: AppTheme(selectedColor: 5).getTheme(),
    );
  }
}
