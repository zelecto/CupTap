import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/presentation/widgets/admin/Home/pedidos_box.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<List<Pedido>> fetchPedidos() async {
  final request =
      ApiRequest(methodType: 'get', endpoint: '/Pedidos', data: null);
  final Response response = await request.request();
  final pedidos = List<Pedido>.from(
      response.data['data'].map((pedido) => Pedido.fromJson(pedido)));

  return pedidos;
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
    pedidos = await fetchPedidos();
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
            child: const Text('Tus pedidos activos'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                return PedidosBox(
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
