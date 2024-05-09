import 'package:cutap/presentation/widgets/admin/Managment/entity_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntityManagerView extends StatefulWidget {
  const EntityManagerView({super.key});

  @override
  State<EntityManagerView> createState() => _EntityManagerViewState();
}

class _EntityManagerViewState extends State<EntityManagerView> {
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  List entities = [
    ['Productos', Icons.fastfood, '/admins/products'],
    ['Pedidos', Icons.shopping_cart_outlined, '/admins/orders'],
    // ['Promociones', Icons.local_offer_outlined, '/admins/discounts'],
  ];

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
                  Text(
                    'Gestion de entidades',
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
            Expanded(
              child: GridView.builder(
                itemCount: entities.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                padding: const EdgeInsets.all(25),
                itemBuilder: (context, index) {
                  return EntityBox(
                    entityName: entities[index][0], 
                    icon: entities[index][1], 
                    screenRoute: entities[index][2],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
