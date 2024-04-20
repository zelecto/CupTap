import 'package:cutap/presentation/screens/Widgets/widgets_reutilizables.dart';
import 'package:flutter/material.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrearAppbar("Pedidos", const Icon(Icons.shopping_bag_outlined)),
      body: Column(
        children: [
          NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            backgroundColor: Colors.white,
            indicatorColor: Colors.purple.shade100,
            selectedIndex: currentPageIndex,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.access_time), label: "Pendiente"),
              NavigationDestination(
                  icon: Icon(Icons.access_time), label: "Pendiente"),
            ],
          ),
          currentPageIndex != 0
              ? const TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search),
                  ),
                )
              : const Text(""),
          currentPageIndex == 0 ? const _MyCardPedido() : const Text("Destruir mundo")
        ],
      ),
    );
  }
}

class _MyCardPedido extends StatelessWidget {
  const _MyCardPedido();

  @override
  Widget build(BuildContext context) {
    final double heightDisponible = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text("#Pedido : 100"),
                Spacer(),
                Text("Fecha : 20-04-2024"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.black,
            height: heightDisponible * 0.25,
            width: heightDisponible * 0.25,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                //TODO Aqui la lista de las ventas 
                const FractionallySizedBox(
                 
                  child: SizedBox(
                    
                    child: _DetallePedidoReelView()
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _DetallePedidoReelView extends StatelessWidget {
  const _DetallePedidoReelView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red

    );
  }
}


List<Map<String, dynamic>> productos = [
  {
    'nombre': 'Café Negro',
    'imgUrl': 'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2000, // En pesos colombianos
    'cantidadVenta': 10,
    'subtotal': 20000,
  },
  {
    'nombre': 'Café con Leche',
    'imgUrl': 'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2500,
    'cantidadVenta': 8,
    'subtotal': 20000,
  },
  {
    'nombre': 'Pan de Queso',
    'imgUrl': 'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 1500,
    'cantidadVenta': 15,
    'subtotal': 22500,
  },
  {
    'nombre': 'Avena con Pasas',
    'imgUrl': 'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 3000,
    'cantidadVenta': 5,
    'subtotal': 15000,
  },
  {
    'nombre': 'Empanada',
    'imgUrl': 'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2000,
    'cantidadVenta': 12,
    'subtotal': 24000,
  },
];



