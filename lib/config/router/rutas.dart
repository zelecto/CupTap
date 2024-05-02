import 'package:cutap/presentation/blocs/login/login_cubit.dart';
import 'package:cutap/presentation/blocs/register/register_cubit.dart';
import 'package:cutap/presentation/screens/Widgets/barra_navegacion.dart';
import 'package:go_router/go_router.dart';
import 'package:cutap/presentation/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
        path: '/register_screen',
        builder: (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterScreen(),
            )),
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
