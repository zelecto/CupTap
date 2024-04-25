import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/entity/pedido/datos_prueba.dart';
import 'package:cutap/entity/pedido/venta_producto.dart';
import 'package:cutap/entity/tools/pedidos_sceens_tools/automatic_scrooll_tool.dart';
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
                  icon: Icon(Icons.check_circle_outline), label: "Finalizados"),
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
                : null,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: currentPageIndex == 0
                ? const _MyCardPedido()
                : const Text("Destruir mundo"),
          ),
        ],
      ),
    );
  }
}

class _MyCardPedido extends StatefulWidget {
  const _MyCardPedido();
  @override
  State<_MyCardPedido> createState() => _MyCardPedidoState();
}

class _MyCardPedidoState extends State<_MyCardPedido> {
  final listaPedidos = listaPedidosPrueba;
  late List<AutomaticScroollTool> _automaticScroollTools;

  @override
  void initState() {
    super.initState();
    _automaticScroollTools = listaPedidos
        .map((pedido) =>
            AutomaticScroollTool(cantidadPagina: pedido.ventaProducto.length))
        .toList();
  }

  @override
  void dispose() {
    for (var tool in _automaticScroollTools) {
      tool.cancelarTimers();
      tool.controller.dispose();
    }
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.screenHeight * 0.7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 1.35),
        itemCount: listaPedidos.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              
                for (int i = 0; i < listaPedidos.length; i++) {
                  if (index != i) {
                    _automaticScroollTools[i].cancelarScroll(false);
                  }
                }
              
              
              _automaticScroollTools[index].cancelarScroll(false);
              _automaticScroollTools[index].starScrollTimer();
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text("#Pedido : ${listaPedidos[index].id}"),
                        const Spacer(),
                        Text("Fecha : ${listaPedidos[index].fechaRegistro}"),
                      ],
                    ),
                  ),
                  _DetallePedidoReelView(
                    listaVentas: listaPedidos[index].ventaProducto,
                    automaticScroollTool: _automaticScroollTools[index],
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                  //Pie de tarjeta
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: ScreenSize.screenHeight * 0.06,
                    child: Row(
                      children: [
                        Text("Total : ${listaPedidos[index].total}"),
                        const Spacer(),
                        FilledButton.icon(
                          onPressed: () {},
                          label: Text("Pagado"),
                          icon: Icon(Icons.check_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class _DetallePedidoReelView extends StatefulWidget {
  final List<VentaProducto> listaVentas;
  final AutomaticScroollTool automaticScroollTool;
  const _DetallePedidoReelView({required this.listaVentas, required this.automaticScroollTool});


  @override
  State<_DetallePedidoReelView> createState() => _DetallePedidoReelViewState();
}

class _DetallePedidoReelViewState extends State<_DetallePedidoReelView> {
  late AutomaticScroollTool automaticScroollTool;

  @override
  void initState() {
    super.initState();
    automaticScroollTool = widget.automaticScroollTool;
    //automaticScroollTool.starScrollTimer();
  }

  @override
  void dispose() {
    // Cancelar el temporizador al salir de la página
    widget.automaticScroollTool.cancelarTimers();

    //_timerdetectarInactividad?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: ScreenSize.screenHeight * 0.2,
      child: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                automaticScroollTool.cancelarScroll(true);
              },
              child: PageView.builder(
                controller: automaticScroollTool.controller,
                itemCount: widget.listaVentas.length,
                onPageChanged: (value) {
                  widget.automaticScroollTool.setCurrentPage = value;
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: TextoConNegrita(
                        texto: widget.listaVentas[index].producto.nombre,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.screenWidth * 0.8,
                      height: ScreenSize.screenHeight * 0.12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.listaVentas[index].producto.imgUrl ??  "Imagen por defecto"  ,
                          fit: BoxFit.fill, //Imagen adaptativa
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        children: [
                          Text(
                              "Cantidad : ${widget.listaVentas[index].cantidaVendida}"),
                          const Spacer(),
                          Text(
                              "Precio ${widget.listaVentas[index].subPrecioCobro}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -10,
            top: ScreenSize.screenHeight * 0.20 / 2 - 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () {
                automaticScroollTool.cancelarScroll(true);
                automaticScroollTool.previousPage();
              },
            ),
          ),
          Positioned(
            right: -10,
            top: ScreenSize.screenHeight * 0.20 / 2 - 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              onPressed: () {
                if (automaticScroollTool.controller.hasClients) {
                  automaticScroollTool.nextPage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

