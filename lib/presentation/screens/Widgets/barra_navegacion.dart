import 'package:cutap/presentation/screens/cuenta/cuentaScreen.dart';
import 'package:cutap/presentation/screens/screens.dart';
import 'package:flutter/material.dart';


class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => NavigationExampleState();
}

class NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.purple.shade100,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Principal',
          ),
          NavigationDestination(
            icon: Badge(backgroundColor: Colors.green,child: Icon(Icons.add_shopping_cart_sharp),),
            label: 'CupCar',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('5'),
              child: Icon(Icons.search),
            ),
            label: 'Pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Tu cuenta',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const Home(),

        /// Pedidos Page
         
       const CupCarScreen(),

        /// Consultas Page
        const PedidosScreen(),

        //CuentaCliente Page
        const CuentaClienteScreen()
      ][currentPageIndex],
    );
  }
}
