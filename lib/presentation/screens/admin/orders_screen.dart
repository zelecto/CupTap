import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/presentation/views/admin/create_order.dart';
import 'package:cutap/presentation/views/admin/create_products_view.dart';
import 'package:cutap/presentation/widgets/admin/Home/pedidos_card.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/custom_appbar.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/products_card.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/search_bar.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // Datos de ejemplo para Usuario, Detalle y Estado
  Usuario usuarioAleatorio = Usuario(
    cedula: '12345678',
    nombre: 'NombreAleatorio',
    apellidos: 'ApellidosAleatorios',
    telefono: '1234567890',
    username: 'usuarioAleatorio',
    password: 'contraseñaAleatoria',
  );
// Crear un detalle aleatorio
  // Crear una lista de pedidos
  List<Pedido> pedidos = [
    Pedido(
      id: 1,
      fechaRegistro: DateTime.now(),
      total: 3000.0,
      usuario: Usuario(
        cedula: '12345678',
        nombre: 'NombreAleatorio',
        apellidos: 'ApellidosAleatorios',
        telefono: '1234567890',
        username: 'usuarioAleatorio',
        password: 'contraseñaAleatoria',
      ),
      detalles: [
        Detalle(
          id: 1,
          cantidad: 2,
          subtotal: 2000.0,
          valorDescontado: 0.0,
          promocionAplicada: null,
          producto: Producto(
            nombre: 'ProductoAleatorio',
            descripcion: 'Este es un producto aleatorio',
            precio: 100.0,
            stock: 10,
            ventaActiva: true,
            promocion: null,
            fechaRegistro: DateTime.now(),
            imagen: null,
          ),
          fechaRegistro: DateTime.now(),
        )
      ],
      estado: Estado(
        fechaRegistro: DateTime.now(),
        nombre: 'EstadoAleatorio',
      ),
    ),
    Pedido(
      id: 2,
      fechaRegistro: DateTime.now(),
      total: 4000.0,
      usuario: Usuario(
        cedula: '12345678',
        nombre: 'NombreAleatorio',
        apellidos: 'ApellidosAleatorios',
        telefono: '1234567890',
        username: 'usuarioAleatorio',
        password: 'contraseñaAleatoria',
      ),
      detalles: [
        Detalle(
          id: 1,
          cantidad: 2,
          subtotal: 2000.0,
          valorDescontado: 0.0,
          promocionAplicada: null,
          producto: Producto(
            nombre: 'ProductoAleatorio',
            descripcion: 'Este es un producto aleatorio',
            precio: 100.0,
            stock: 10,
            ventaActiva: true,
            promocion: null,
            fechaRegistro: DateTime.now(),
            imagen: null,
          ),
          fechaRegistro: DateTime.now(),
        )
      ],
      estado: Estado(
        fechaRegistro: DateTime.now(),
        nombre: 'EstadoAleatorio',
      ),
    ),
    Pedido(
      id: 3,
      fechaRegistro: DateTime.now(),
      total: 5000.0,
      usuario: Usuario(
        cedula: '12345678',
        nombre: 'NombreAleatorio',
        apellidos: 'ApellidosAleatorios',
        telefono: '1234567890',
        username: 'usuarioAleatorio',
        password: 'contraseñaAleatoria',
      ),
      detalles: [
        Detalle(
          id: 1,
          cantidad: 2,
          subtotal: 2000.0,
          valorDescontado: 0.0,
          promocionAplicada: null,
          producto: Producto(
            nombre: 'ProductoAleatorio',
            descripcion: 'Este es un producto aleatorio',
            precio: 100.0,
            stock: 10,
            ventaActiva: true,
            promocion: null,
            fechaRegistro: DateTime.now(),
            imagen: null,
          ),
          fechaRegistro: DateTime.now(),
        )
      ],
      estado: Estado(
        fechaRegistro: DateTime.now(),
        nombre: 'EstadoAleatorio',
      ),
    ),
  ];

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
                    child: ListView.builder(
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
