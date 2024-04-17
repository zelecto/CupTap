import 'package:cutap/presentation/screens/Widgets/widgets_reutilizables.dart';
import 'package:flutter/material.dart';

class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrearAppbar("Pedidos", const Icon(Icons.shopping_bag_outlined)),
      body:  const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child:  Column(
            children: [
               TextField(
                 decoration: InputDecoration(
                   hintText: 'Buscar...',
                   prefixIcon: Icon(Icons.search),
                 ),
               ),
               SizedBox(height: 10,),
               TextoConNegrita(
                fontSize: 25,
                texto: "Tus pedido",
              ),
              Divider(
                color: Colors.black38,
                thickness: 3,
              ),

              Card(
                elevation: 15,
                child: _MyCardPedido()
                ),
          
            ],
          ),
        ),
      ),
    );
  }
}

class _MyCardPedido extends StatelessWidget {
  const _MyCardPedido();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              width: 100,
              height: 100,
              child: Image.network("https://premier.com.co/wp-content/uploads/2020/11/empanadas-antioquenas.webp",
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 100,
              height: 100,
              child: Image.network("https://premier.com.co/wp-content/uploads/2020/11/empanadas-antioquenas.webp"),
            ),
           Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 100,
              height: 100,
              child: Image.network("https://premier.com.co/wp-content/uploads/2020/11/empanadas-antioquenas.webp"),
            ),
            
          ],
        )
      ],
    );
  }
}







