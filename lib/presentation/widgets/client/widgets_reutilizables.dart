
import 'package:flutter/material.dart';

//TODO Arreglar el tamaño del texto del adbar
AppBar crearAppbar(String subtile, Widget icono){
  return  AppBar(
    title:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: TextoAppBar(subTitle: subtile)),
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
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TextoConNegrita(texto: "Cuptap",fontSize: 30),
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
  final Color? color;
  const TextoConNegrita({
    super.key, required this.texto, required this.fontSize, this.color=Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      texto,
      style:  TextStyle(
        fontWeight: FontWeight.bold, 
        fontSize: fontSize, 
        color: color
      ),
    );
  }
}
