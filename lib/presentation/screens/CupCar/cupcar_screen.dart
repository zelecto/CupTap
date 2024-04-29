import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/presentation/screens/Widgets/widgets_reutilizables.dart';
import 'package:flutter/material.dart';


class CupCarScreen extends StatefulWidget {
  const CupCarScreen({super.key});

  @override
  State<CupCarScreen> createState() => _CupCarScreenState();
}

class _CupCarScreenState extends State<CupCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: crearAppbar(
          "Realiza tus pedidos", const Icon(Icons.shopping_bag_outlined)),
      body: CustomScrollView(
        
        slivers: [
          SliverPadding(padding: const EdgeInsets.all(15),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Center(
                  child: TextoConNegrita(
                    fontSize: 25,
                    texto: "TU COMPRA",
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                  thickness: 3,
                ),
              ]),
            ),
          ),

          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              childAspectRatio: 3,
              mainAxisSpacing: 20,
                ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: _MyCardPedido(
                      "Empanada",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGSZU9NZXEIFylmIrCbu7D6L9g8vxRAooAWw&usqp=CAU",
                      10000,
                      100000,
                      100),
                );
              },
              childCount: 5,
            ),
          ),
          
          SliverPadding(padding: const EdgeInsets.all(20),
           sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text("RESERVAR"),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () {},
                      child: const Text("PAGAR"),
                    ),
                  ],
                ),
                
              ]),
            ),
          )
          
        ],
      ),
    );
  }
}

class _MyCardPedido extends StatelessWidget {
  final String nameProduct;
  final String imgUrl;
  final double precioCobrar;
  final double totalPagar;
  final int cantidadVendida;
  

  const _MyCardPedido(
    this.nameProduct, 
    this.imgUrl, 
    this.precioCobrar,
    this.totalPagar, 
    this.cantidadVendida
  );
  TextStyle estiloTexto(Color color) {
    return TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w600);
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(5, 5),
          ),
        ], 
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: ScreenSize.screenWidth*0.40,
              height: ScreenSize.screenHeight*0.15,
              child: Image.network(imgUrl, fit: BoxFit.cover),
            ),
          ),

          SizedBox(
            width: ScreenSize.screenWidth*0.40,
            height: ScreenSize.screenHeight*0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextoConNegrita(texto: nameProduct, fontSize: 25),
                Text("15 U", 
                  style: estiloTexto(Colors.grey.shade600)),
                Row(
                  children: [
                    Text(
                      "$precioCobrar ",
                      textAlign: TextAlign.center,
                      style: estiloTexto(Colors.blue),
                    ),
                    const Icon(Icons.attach_money,color: Colors.blue, size: 20,)
                  ],
                ),
                //Pie de tarjeta
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
