import 'package:cutap/domain/models/modelos.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductView extends StatefulWidget {
  final ScrollController scrollController;
  final void Function(Producto) onProductCreated;
  const CreateProductView(
      {super.key,
      required this.scrollController,
      required this.onProductCreated});

  @override
  State<CreateProductView> createState() => _CreateProductViewState();
}

class _CreateProductViewState extends State<CreateProductView> {
  void _createButtonTapped() {
    Producto nuevoProducto = Producto(
      nombre: 'prueba',
      precio: 20.000,
      stock: 20,
      ventaActiva: true,
      fechaRegistro: DateTime.now(),
      imagen: null,
    );

    // Llamar a la función de callback
    widget.onProductCreated(nuevoProducto);
    context.pop();
  }

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
                'Crear producto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        hintText: 'Empanada',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
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
                        height: 60,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: '10',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16), // Espacio entre los dos inputs
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Precio',
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Container(
                        height: 60,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: '10.000COP',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Imagen del producto',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: _pickImageFromGallery,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Carga aqui',
                              style: TextStyle(
                                  color: Color(0xFF6A6A6A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.upload_file_rounded)
                          ],
                        )),
                  )
                ],
              ),
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
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
