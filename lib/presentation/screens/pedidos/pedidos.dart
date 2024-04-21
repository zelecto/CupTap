import 'dart:async';

import 'package:cutap/config/Screeb/screen_size.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: currentPageIndex != 0
                ? const TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  )
                : const Text(""),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: currentPageIndex == 0
                ? _MyCardPedido()
                : const Text("Destruir mundo"),
          )
        ],
      ),
    );
  }
}

class _MyCardPedido extends StatelessWidget {
  _MyCardPedido();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _cancelarScroll();
      },
      child: Card(
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: ScreenSize.screenHeight * 0.25,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: () {
                      _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.decelerate);
                      _cancelarScroll();
                    },
                  ),
                  //TODO Aqui la lista de las ventas
                  const _DetallePedidoReelView(),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.decelerate,
                      );
                      _cancelarScroll();
                    },
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class _DetallePedidoReelView extends StatefulWidget {
  const _DetallePedidoReelView();

  @override
  State<_DetallePedidoReelView> createState() => _DetallePedidoReelViewState();
}


class _DetallePedidoReelViewState extends State<_DetallePedidoReelView> {
  
  @override
  void initState() {
    super.initState();
    _starScrollTimer();
  }

  @override
  void dispose() {
    // Cancelar el temporizador al salir de la página
    _timer?.cancel();
    _timerdetectarInactividad?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenSize.screenWidth * 0.66,
        child: PageView.builder(
          controller: _controller,
          itemCount: productos.length,
          onPageChanged: (value) {
            _currentPage = value;
            
          },
          itemBuilder: (context, index) => Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: TextoConNegrita(
                  texto: productos[index]["nombre"], fontSize: 20),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              width: ScreenSize.screenWidth * 0.7,
              height: ScreenSize.screenHeight * 0.15,
              child: Image.network(
                productos[index]["imgUrl"],
                fit: BoxFit.cover, //Imagen adaptativa
              ),
            ),
            
            Expanded(
              child: Row(children: [
                Text("Cantidad : ${productos[index]["cantidadVenta"]}"),
                const Spacer(),
                Text("Precio ${productos[index]["precio"]}"),
              ]),
            ),
          ]),
        ));
  }
}

List<Map<String, dynamic>> productos = [
  {
    'nombre': 'Café Negro',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2000, // En pesos colombianos
    'cantidadVenta': 10,
    'subtotal': 20000,
  },
  {
    'nombre': 'Café con Leche',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2500,
    'cantidadVenta': 8,
    'subtotal': 20000,
  },
  {
    'nombre': 'Pan de Queso',
    'imgUrl':
        'https://assets.elgourmet.com/wp-content/uploads/2023/10/shutterstock_1758025376-1-1024x683.jpg.webp',
    'precio': 1500,
    'cantidadVenta': 15,
    'subtotal': 22500,
  },
  {
    'nombre': 'Avena con Pasas',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 3000,
    'cantidadVenta': 5,
    'subtotal': 15000,
  },
  {
    'nombre': 'Empanada',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2000,
    'cantidadVenta': 12,
    'subtotal': 24000,
  },
];


//Controladores global del scroll
int _currentPage = 1;
final PageController _controller = PageController();
Timer? _timer;
Timer? _timerdetectarInactividad;
bool _comprovarInactividad = false;
bool _detenerScroll = false;

void _cancelarScroll() {
  _comprovarInactividad = true;
  _detenerScroll = true;

  _timer?.cancel(); // Cancelar el temporizador de desplazamiento
  _timerdetectarInactividad
      ?.cancel(); // Cancelar el temporizador de detección de inactividad
  _detectarInactividad(); // Reiniciar la detección de inactividad
}

void _starScrollTimer() {
  if (!_detenerScroll) {
    _comprovarInactividad = false;
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < productos.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }
}

void _detectarInactividad() {
  if (_comprovarInactividad) {
    _timerdetectarInactividad = Timer.periodic(Duration(seconds: 6), (timer) {
      if (_detenerScroll) {
        _detenerScroll = false;
        print("Detener Scroll: $_detenerScroll");
        _starScrollTimer(); // Reiniciar el temporizador de desplazamiento
      }
    });
  }
}
