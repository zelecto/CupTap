import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/presentation/views/admin/create_order.dart';
import 'package:cutap/presentation/widgets/admin/Home/pedidos_card.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/custom_appbar.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/search_bar.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

Future<List<Pedido>> fetchPedidosss() async {
  final request =
      ApiRequest(methodType: 'get', endpoint: '/Pedidos', data: null);
  final Response response = await request.request();
  final pedidos = List<Pedido>.from(
      response.data['data'].map((pedido) => Pedido.fromJson(pedido)));

  return pedidos;
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Pedido> pedidos = [];
  bool isLoading = false; // Añade esta línea

  @override
  void initState() {
    super.initState();
    loadPedidos();
  }

  Future<void> loadPedidos() async {
    setState(() {
      isLoading = true; // Comienza la carga
    });
    pedidos = await fetchPedidosss();
    setState(() {
      isLoading = false; // Comienza la carga
    });
  }

  void _openButtonTapped() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.75,
            maxChildSize: 0.75,
            minChildSize: 0.1,
            builder: (context, scrollController) {
              return CreateOrderView(
                scrollController: scrollController,
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(
        title: 'Tus pedidos',
        showAction: true,
        bgColor: Color(0xFFF8F9FA),
        actionText: Text(
          'Guardar',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5B9EE1)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const CustomSearchBar(
                    hint: 'Busca tus productos',
                    iconColor: Color(0xFF707B81),
                    icon: Iconsax.search_normal),
                const SizedBox(height: 24),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child:
                        isLoading // Comprueba si se están cargando los pedidos
                            ? const Center(
                                child:
                                    CircularProgressIndicator()) // Muestra el spinner de carga
                            : ListView.builder(
                                // Muestra la lista de pedidos
                                itemCount: pedidos.length,
                                itemBuilder: (context, index) {
                                  final pedido = pedidos[index];
                                  return PedidosCard(pedido: pedido);
                                }),
                  ),
                ),
                InkWell(
                  onTap: _openButtonTapped,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFF0066FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Agregar pedido',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Iconsax.add,
                              color: Colors.white,
                              weight: 2,
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
