import 'dart:ui';

import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/presentation/widgets/admin/Home/pedidos_card.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

Future<List<Pedido>> fetchPedidos() async {
  final request =
      ApiRequest(methodType: 'get', endpoint: '/Pedidos', data: null);
  final Response response = await request.request();
  final pedidos = List<Pedido>.from(
      response.data['data'].map((pedido) => Pedido.fromJson(pedido)));

  final pedidosRealizados =
      pedidos.where((pedido) => pedido.estado == 'Realizado').toList();

  print(pedidosRealizados.toString());

  return pedidosRealizados;
}

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  List<Pedido> pedidos = [];

  void calculateProductosMasVendidos() {
    Map<String, int> productosMasVendidos = {};
    List<Pedido> pedidosRealizados =
        pedidos.where((pedido) => pedido.estado.nombre == 'Realizado').toList();

    // for (var pedido in pedidosRealizados) {
    //   for (var producto in pedido.productos) {
    //     if (productosMasVendidos.containsKey(producto.nombre)) {
    //       productosMasVendidos[producto.nombre]++;
    //     } else {
    //       productosMasVendidos[producto.nombre] = 1;
    //     }
    //   }
    // }
  }

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
      // appBar: AppBar(title: Text('Estadisticas'), ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            // Agrega esto
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estadisticas',
                        style: GoogleFonts.bebasNeue(fontSize: 62),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200, // Ajusta este valor según tus necesidades
                    width: 200,
                    child: Stack(children: [
                      PieChart(
                        PieChartData(
                          startDegreeOffset: 0,
                          sections: [
                            PieChartSectionData(
                              showTitle: false,
                              value: 25,
                              title: 'Rojo',
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFF6393),
                                  Color(0XFFC1C8FF),
                                ],
                              ),
                              radius: 20,
                            ),
                            PieChartSectionData(
                              showTitle: false,
                              value: 25,
                              title: 'Verde',
                              radius: 20,
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF47DDC2),
                                  Color(0XFFC1FFC8),
                                ],
                              ),
                            ),
                            PieChartSectionData(
                              showTitle: false,
                              value: 25,
                              title: 'Azul',
                              radius: 20,
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFF6393),
                                  Color(0XFFC1C8FF),
                                ],
                              ),
                            ),
                            PieChartSectionData(
                              showTitle: false,
                              value: 25,
                              title: 'Amarillo',
                              radius: 20,
                              gradient: const RadialGradient(
                                colors: [
                                  Color(0xFFC172FF),
                                  Color(0XFF08E6F8),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Añade esta línea
                            children: [
                              Text(
                                '25%',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Ganancias',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Historial de ventas',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: pedidos.length,
                          itemBuilder: (context, index) {
                            final pedido = pedidos[index];
                            return PedidosCard(
                              pedido: pedido,
                            );
                          },
                          shrinkWrap:
                              true, // Asegúrate de que ListView no se expanda infinitamente
                          physics:
                              NeverScrollableScrollPhysics(), // Deshabilita el desplazamiento en ListView ya que ya está dentro de un SingleChildScrollView
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
