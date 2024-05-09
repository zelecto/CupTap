
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//TODO Arreglar el tamaño del texto del adbar
AppBar crearAppbar(String subtile, BuildContext context ){

  return  AppBar(
    title:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        TextoAppBar(subTitle: subtile),
        const Spacer(),
        IconButton(onPressed: (){
          context.push("/Account");
        }, icon: const Icon(Icons.settings_outlined)),
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
