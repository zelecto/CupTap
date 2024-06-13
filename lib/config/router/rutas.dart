import 'package:cutap/presentation/blocs/login/login_cubit.dart';
import 'package:cutap/presentation/blocs/products/products_cubit.dart';
import 'package:cutap/presentation/blocs/register/register_cubit.dart';
import 'package:cutap/presentation/screens/admin/orders_screen.dart';
import 'package:cutap/presentation/screens/client/account/account.dart';
import 'package:cutap/presentation/widgets/client/barra_navegacion.dart';
import 'package:cutap/presentation/screens/admin/home_screen.dart';
import 'package:cutap/presentation/screens/admin/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cutap/presentation/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget _buildEntityScreen(String tipo) {
  switch (tipo) {
    case 'products':
      return BlocProvider<ProductsCubit>(
        create: (context) => ProductsCubit(),
        child: const ProductsScreen(),
      );
    case 'orders':
      return const OrdersScreen();
    default:
      return Container();
  }
}

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginScreen(),
            )),
    GoRoute(
        path: '/register_screen',
        builder: (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterScreen(),
            )),
    GoRoute(
      path: '/admins/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
      },
    ),
    GoRoute(
      path: '/admins/:entity',
      builder: (context, state) {
        final entity = state.pathParameters['entity'] ?? "";
        return _buildEntityScreen(entity);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
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
    GoRoute(
      path: '/Account',
      builder: (context, state) => const Account(),
    ),
  ],
);
