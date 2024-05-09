import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CreateProductView extends StatelessWidget {
  final ScrollController scrollController;
  const CreateProductView({super.key, required this.scrollController});

  void _createButtonTapped() {
    
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
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Row(
                        children: [
                          SizedBox(width: 16),
                          Text(
                            'Empanada',
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
                            children: [
                              SizedBox(width: 16),
                              Text(
                                '10',
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
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Imagen del producto',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Container(
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
                      ))
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
}
