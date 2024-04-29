import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/config/router/rutas.dart';
import 'package:cutap/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp())
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Manejador del tamño de la pantalla
    ScreenSize.init(context);
    return MaterialApp.router(
      title: 'Cup-Tap',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      
        
    );
  }
}
