import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/config/router/rutas.dart';
import 'package:cutap/config/theme/app_theme.dart';
import 'package:cutap/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
