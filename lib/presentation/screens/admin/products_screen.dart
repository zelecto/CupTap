import 'package:cutap/presentation/widgets/admin/Managment/products/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Productos'),
      body: Stack(
        children: [Column(), Positioned(child: Row())],
      ),
    );
  }
}
