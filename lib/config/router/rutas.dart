import 'package:cutap/presentation/screens/Widgets/barra_navegacion.dart';
import 'package:go_router/go_router.dart';
import 'package:cutap/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const IniciarSesion(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) =>  const Home(),
    ),
    GoRoute(
      path: '/barraNavegacion',
      builder: (context, state) =>   const NavigationExample(),
    ),
    GoRoute(
      path: '/Pedidos',
      builder: (context, state) =>   const PedidosScreen(),
    ),

    
  ],
);
