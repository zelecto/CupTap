import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/presentation/widgets/admin/Home/pedidos_card.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<List<Pedido>> fetchPedidosss() async {
  final request =
      ApiRequest(methodType: 'get', endpoint: '/Pedidos', data: null);
  final Response response = await request.request();
  final pedidos = List<Pedido>.from(
      response.data['data'].map((pedido) => Pedido.fromJson(pedido)));

  final pedidosPendientes =
      pedidos.where((pedido) => pedido.estado.nombre == 'Pendiente').toList();

  return pedidosPendientes;
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;
  List<Pedido> pedidos = [];

  @override
  void initState() {
    super.initState();
    loadPedidos();
  }

  Future<void> loadPedidos() async {
    pedidos = await fetchPedidosss();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bienvenido,',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Administrador',
                  style: GoogleFonts.bebasNeue(fontSize: 62),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Text(
              'Tus pedidos activos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                return PedidosCard(
                  pedido: pedido,
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
