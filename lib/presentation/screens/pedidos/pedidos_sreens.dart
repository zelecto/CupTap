import 'package:cutap/config/Screeb/screen_size.dart';

import 'package:cutap/entity/pedido/detalle_pedido.dart';
import 'package:cutap/entity/pedido/pedido.dart';
import 'package:cutap/entity/tools/pedidos_sceens_tools/automatic_scrooll_tool.dart';
import 'package:cutap/presentation/provider/pedido/pedido_provider.dart';
import 'package:cutap/presentation/screens/Widgets/widgets_reutilizables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PedidosScreen extends ConsumerStatefulWidget {
  const PedidosScreen({super.key});

  @override
  PedidosScreenState createState() => PedidosScreenState();
}

class PedidosScreenState extends ConsumerState<PedidosScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO IMPLEMENTAR USUARIO
    final pedidoAsync = ref.watch(consultaPedidoProvider("1067593679"));
    return Scaffold(
        appBar: crearAppbar("Pedidos", const Icon(Icons.shopping_bag_outlined)),
        body: pedidoAsync.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _MyCardPedido(
                listaPedidos: data,
              ),
            ),
          ),
          error: (error, stackTrace) => Text("$error"),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}

class _MyCardPedido extends StatefulWidget {
  final List<Pedido> listaPedidos;
  const _MyCardPedido({required this.listaPedidos});
  @override
  MyCardPedidoState createState() => MyCardPedidoState();
}

class MyCardPedidoState extends State<_MyCardPedido> {
  //TODO: Consulta en la base de datos
  late List<AutomaticScroollTool> _automaticScroollTools;

  @override
  void initState() {
    super.initState();

    _automaticScroollTools = widget.listaPedidos
        .map((pedido) =>
            AutomaticScroollTool(cantidadPagina: pedido.detalles.length))
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

  void fechData() async {}

  @override
  Widget build(BuildContext context) {
    // TODO  IMPLEMENTAR USUARIO

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ]),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 1.35),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  for (int i = 0; i < widget.listaPedidos.length; i++) {
                    if (index != i) {
                      _automaticScroollTools[i].cancelarScroll(false);
                    }
                  }

                  _automaticScroollTools[index].cancelarScroll(false);
                  _automaticScroollTools[index].starScrollTimer();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(1, 8),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text("#Pedido : ${widget.listaPedidos[index].id}"),
                            const Spacer(),
                            Text(
                                "${widget.listaPedidos[index].fechaRegistro?.day}/${widget.listaPedidos[index].fechaRegistro?.month}/${widget.listaPedidos[index].fechaRegistro?.year}"),
                          ],
                        ),
                      ),
                      _DetallePedidoReelView(
                        listaVentas: widget.listaPedidos[index].detalles,
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
                            Text("Total : ${widget.listaPedidos[index].total}"),
                            const Spacer(),
                            widget.listaPedidos[index].estado.nombre ==
                                    "Pendiente"
                                ? FilledButton.icon(
                                    onPressed: () {},
                                    label: const Text("Pendiente"),
                                    icon: const Icon(Icons.check_rounded),
                                  )
                                : FilledButton.icon(
                                    onPressed: null,
                                    label: const Text("Pagado"),
                                    icon: const Icon(Icons.check_rounded),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: widget.listaPedidos.length,
          ),
        ),
      ],
    );
  }
}

class _DetallePedidoReelView extends StatefulWidget {
  final List<DetallePedido> listaVentas;
  final AutomaticScroollTool automaticScroollTool;
  const _DetallePedidoReelView(
      {required this.listaVentas, required this.automaticScroollTool});

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
                        //TODO implementar fotos de la base de datos
                        child: Image.network(
                          "https://i.ytimg.com/vi/m3acCpS4DJg/maxresdefault.jpg",
                          fit: BoxFit.cover, //Imagen adaptativa
                        ),
                      ),
                    ),
                    // TODO: implementar los pedidos por base de datos
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        children: [
                          Text(
                              "Cantidad : ${widget.listaVentas[index].cantidad}"),
                          const Spacer(),
                          Text("Precio ${widget.listaVentas[index].subtotal}"),
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
