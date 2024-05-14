import 'package:cutap/domain/models/modelos.dart';
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
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: producto.imagen,
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
                    const Text(
                      '1',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
            InkWell(
              onTap: (){},
              child: Container(
                alignment: Alignment.bottomRight,
                child: const Icon(
                  Iconsax.trash,
                  size: 30,
                  color: Color(0xFFF87265),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
