

import 'package:flutter/material.dart';

AppBar CrearAppbar(String subtile, Widget icono){
  return  AppBar(
    centerTitle: true,
    title:  Row(
      children: [
        TextoAppBar(subTitle: subtile),
        icono,
      ],
      
    ),
  );
}

      
class TextoAppBar extends StatelessWidget {
  final String subTitle;
  const TextoAppBar({
    super.key, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextoConNegrita(texto: "Cuptap",fontSize: 30.0),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class TextoConNegrita extends StatelessWidget {
  final String texto;
  final double fontSize;
  const TextoConNegrita({
    super.key, required this.texto, required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      texto,
      style:  TextStyle(
        fontWeight: FontWeight.bold, // Negrita
        fontSize: fontSize, // Tamaño de fuente
      ),
    );
  }
}
