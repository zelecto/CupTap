import 'package:cutap/presentation/screens/Widgets/barra_navegacion.dart';
import 'package:go_router/go_router.dart';
import 'package:cutap/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
        path: '/register_screen',
        builder: (context, state) => const RegisterScreen()),
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: '/barraNavegacion',
      builder: (context, state) => const NavigationExample(),
    ),
    GoRoute(
      path: '/CupcarScreen',
      builder: (context, state) => const CupCarScreen(),
    ),
    GoRoute(
      path: '/Pedidos',
      builder: (context, state) => const PedidosScreen(),
    ),
  ],
);
