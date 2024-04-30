import 'package:animate_do/animate_do.dart';
import 'package:cutap/entity/pedido/detalle_pedido.dart';
import 'package:cutap/presentation/provider/pedido/detalles_pedido_provider.dart';
import 'package:cutap/presentation/screens/cuenta/cuentaScreen.dart';
import 'package:cutap/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationExample extends ConsumerStatefulWidget {
  const NavigationExample({super.key});

  @override
  NavigationExampleState createState() => NavigationExampleState();
}

class NavigationExampleState extends ConsumerState<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<DetallePedido> listaDetalles = ref.watch(detallesPedidoProvider);
    final int numeroDetalles = listaDetalles.length;

    return Scaffold(
      bottomNavigationBar: FadeInUp(
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.blue.shade100,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            const NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Principal',
            ),
            NavigationDestination(
              icon: Badge(
                  label: numeroDetalles > 0 ? Text("$numeroDetalles") : null,
                  backgroundColor:
                      numeroDetalles > 0 ? Colors.green : Colors.grey,
                  child: const Icon(Icons.shopping_bag_outlined)),
              label: 'CupCar',
            ),
            const NavigationDestination(
              icon: Badge(
                label: Text('5'),
                child: Icon(Icons.search),
              ),
              label: 'Pedidos',
            ),
            const NavigationDestination(
              icon: Icon(Icons.people),
              label: 'Tu cuenta',
            )
          ],
        ),
      ),
      body: [
        /// Home page
        FadeInDown(child: const Home()),

        /// Pedidos Page

        FadeInLeft(child: const CupCarScreen()),

        /// Consultas Page
        FadeInRight(child: const PedidosScreen()),

        //CuentaCliente Page
        FadeInUp(child: const CuentaClienteScreen())
      ][currentPageIndex],
    );
  }
}
