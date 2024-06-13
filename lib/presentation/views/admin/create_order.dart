import 'package:cutap/domain/models/producto/producto.dart';
import 'package:cutap/presentation/widgets/client/inputs/admins_form_input.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

Future<List<Producto>> fetchProductos() async {
  final request =
      ApiRequest(methodType: 'get', endpoint: '/Productos', data: null);
  final Response response = await request.request();
  final productos = List<Producto>.from(
      response.data['data'].map((producto) => Producto.fromJson(producto)));

  return productos;
}

class CreateOrderView extends StatefulWidget {
  final ScrollController scrollController;
  const CreateOrderView({super.key, required this.scrollController});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  List<Producto> productos = [];
  String dropdownValue = 'Empanada'; // Inicializa con un valor de tu lista

  @override
  void initState() {
    super.initState();
    loadProductos();
  }

  Future<void> loadProductos() async {
    productos = await fetchProductos();
    if (mounted) {
      // Comprueba si el widget todavía está montado
      setState(() {
        dropdownValue = (productos.isNotEmpty ? productos[0].nombre : null)!;
      });
    }
  }

  void _createButtonTapped() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 239, 239),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 13),
            Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 212, 214),
                  borderRadius: BorderRadius.circular(16)),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Crear pedido',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 30),
            AdminCustomInput(
                hint: 'Nathan Ospino', title: 'Nombre del cliente'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Producto',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue ?? '';
                          });
                        },
                        items: productos
                            .map<DropdownMenuItem<String>>((Producto producto) {
                          return DropdownMenuItem<String>(
                            value: producto.nombre,
                            child: Text(
                              producto.nombre,
                              style: TextStyle(
                                  color: Color(0xFF6A6A6A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cantidad',
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 16),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Color(0xFF6A6A6A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(width: 16), // Espacio entre los dos inputs
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Precio',
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Row(
                            children: [
                              SizedBox(width: 16),
                              Text(
                                '10.000COP',
                                style: TextStyle(
                                    color: Color(0xFF6A6A6A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            InkWell(
              onTap: _createButtonTapped,
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
          ],
        ),
      ),
    );
  }
}
