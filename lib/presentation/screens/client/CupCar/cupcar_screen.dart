import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:cutap/domain/models/pedido/detalle_pedido.dart';
import 'package:cutap/domain/models/pedido/estado.dart';
import 'package:cutap/domain/models/pedido/pedido.dart';
import 'package:cutap/presentation/provider/pedido/detalles_pedido_provider.dart';
import 'package:cutap/presentation/provider/producto/producto_provider.dart';
import 'package:cutap/presentation/widgets/client/widgets_reutilizables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CupCarScreen extends ConsumerStatefulWidget {
  const CupCarScreen({super.key});

  @override
  CupCarScreenState createState() => CupCarScreenState();
}

class CupCarScreenState extends ConsumerState<CupCarScreen> {
  bool isLoading=false;

  Future<void> postPedido(Pedido pedido) async {
    
      ApiRequest apiRequest = ApiRequest(
        methodType: "post",
        endpoint: "/Pedidos",
        data: pedido.toJson(),
      );
      apiRequest.loading.listen((event) {
        isLoading = event;
        setState(() {});
      });

      final response = await apiRequest.request(); // Esperar la respuesta de la solicitud HTTP
      print(response);
      if (response.statusCode == 200 && response.data["success"]) {
        ref.invalidate(consultaProductosProvider);
        ref.invalidate(detallesPedidoProvider);
      }
    
    
  }

  @override
  Widget build(BuildContext context) {
    final List<DetallePedido> listaDetalles = ref.watch(detallesPedidoProvider);
    double totalPagar = 0;
    for (var element in listaDetalles) {
      totalPagar += element.subtotal;
    }
    return Scaffold(
        appBar: crearAppbar(
            "Consulta tu carrito",context),
        body: listaDetalles.isNotEmpty
            ? isLoading ?  const CircularProgressIndicator()  : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(15),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(
                          height: ScreenSize.screenHeight * 0.01,
                        )
                      ]),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3,
                      mainAxisSpacing: 20,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: _MyCardPedido(
                              detallePedido: listaDetalles[index],
                            ));
                      },
                      childCount: listaDetalles.length,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const TextoConNegrita(
                                  texto: "Total", fontSize: 20),
                              const Spacer(),
                              TextoConNegrita(
                                  texto: "$totalPagar", fontSize: 20),
                              const Icon(Icons.attach_money)
                            ],
                          ),
                        ),
                        const Divider(
                          height: 20,
                          color: Colors.black38,
                          thickness: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton(
                            onPressed: () async {
                              Pedido pedido = Pedido(
                                  detalles: listaDetalles,
                                  estado:
                                      EstadoPedido(nombre: "Pendiente"));
                              await postPedido(pedido);
                              
                            },
                            child: const Text("Ordenar"),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              )
            : const CupCarVacioView());
  }
}

class _MyCardPedido extends ConsumerWidget {
  final DetallePedido detallePedido;

  const _MyCardPedido({required this.detallePedido});
  TextStyle estiloTexto(Color color) {
    return TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w600);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: ScreenSize.screenWidth * 0.40,
                height: ScreenSize.screenHeight * 0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                      image:  detallePedido.producto.img,
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              width: ScreenSize.screenWidth * 0.40,
              height: ScreenSize.screenHeight * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextoConNegrita(
                      texto: detallePedido.producto.nombre, fontSize: 25),
                  Text("${detallePedido.cantidad} U",
                      style: estiloTexto(Colors.grey.shade600)),
                  Row(
                    children: [
                      Text(
                        "${detallePedido.subtotal} ",
                        textAlign: TextAlign.center,
                        style: estiloTexto(Colors.blue),
                      ),
                      const Icon(
                        Icons.attach_money,
                        color: Colors.blue,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(15))),
            child: IconButton(
                onPressed: () {
                  ref
                      .read(detallesPedidoProvider.notifier)
                      .eliminarDetalle(detallePedido);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                )),
          ),
        )
      ]),
    );
  }
}

class CupCarVacioView extends StatelessWidget {
  const CupCarVacioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(
                "assets/images/CupCarVacio.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text(
              "Tu carrito está vacío",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
