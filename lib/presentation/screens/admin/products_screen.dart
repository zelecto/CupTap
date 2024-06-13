import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/presentation/blocs/products/products_cubit.dart';
import 'package:cutap/presentation/views/admin/create_products_view.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/custom_appbar.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/products_card.dart';
import 'package:cutap/presentation/widgets/admin/Managment/products/search_bar.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

Future<List<Producto>> fetchProductos() async {
  final request =
      ApiRequest(methodType: 'get', endpoint: '/Productos', data: null);
  final Response response = await request.request();
  final productos = List<Producto>.from(
      response.data['data'].map((producto) => Producto.fromJson(producto)));

  return productos;
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Producto> productos = [];
  bool isLoading = false; // Añade esta línea

  @override
  void initState() {
    super.initState();
    loadProductos();
  }

  Future<void> loadProductos() async {
    setState(() {
      isLoading = true; // Comienza la carga
    });
    print('hola mundo');
    productos = await fetchProductos();
    setState(() {
      isLoading = false; // Termina la carga
    });
  }

  void _openButtonTapped() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          maxChildSize: 0.8,
          minChildSize: 0.1,
          builder: (context, scrollController) {
            return CreateProductView(
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formStatusWatcher = context.watch<ProductsCubit>();

    return BlocListener<ProductsCubit, ProductsFormState>(
        listener: (context, state) {
          print(state);
          if (formStatusWatcher.state.formStatus == FormStatus.created ||
              formStatusWatcher.state.formStatus == FormStatus.deleted) {
            // Realiza la operación asíncrona primero
            loadProductos().then((_) {
              // Luego, actualiza el estado de manera sincrónica
              setState(() {
                // Aquí va tu código para actualizar el estado
              });
            });
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: CustomAppBar(
            title: 'Tus productos',
            showAction: true,
            bgColor: const Color(0xFFF8F9FA),
            onTap: () => loadProductos(),
            actionText: const Text(
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
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child:
                            isLoading // Si está cargando, muestra un skeleton
                                ? const Center(
                                    child:
                                        CircularProgressIndicator()) // Reemplaza esto con tu widget de skeleton
                                : ListView.builder(
                                    // Si no está cargando, muestra la lista
                                    itemCount: productos.length,
                                    itemBuilder: (context, index) {
                                      final producto = productos[index];
                                      return ProductosCard(producto: producto);
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
                                Text('Agregar producto',
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
        ));
  }
}
