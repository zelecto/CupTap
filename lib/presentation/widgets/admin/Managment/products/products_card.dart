import 'package:cutap/domain/models/modelos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ProductosCard extends StatelessWidget {
  final Producto producto;
  const ProductosCard({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          height: 100,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Image(image: producto.imagen),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  producto.nombre,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(producto.precio)}c/u',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(width: 3),
                    const Icon(
                      Iconsax.edit_2,
                      color: Color.fromARGB(255, 186, 178, 178),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: const Icon(Iconsax.minus),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      producto.stock.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xFF5B9EE1)),
                        child: const Icon(
                          Iconsax.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                const Spacer(),
                IconButton(
                    icon: const Icon(
                      Iconsax.trash,
                      size: 30,
                      color: Color(0xFFF87265),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              surfaceTintColor: Colors.white,
                              insetPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              content: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 46, vertical: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: Color(0xFFDFEFFF),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24),
                                          child: Image.asset(
                                            'assets/image.png', // Cambia esto a la ruta correcta de tu imagen
                                            width: 86,
                                            height: 86,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Eliminación realizada',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        width: 300,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.blue, // Color del botón
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  50.0), // Bordes redondeados
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 16.0),
                                            child: Text(
                                              'Volver',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
          ]),
        ));
  }
}
