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
      appBar: CrearAppbar(
          "Realiza tus pedidos", const Icon(Icons.shopping_bag_outlined)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: SingleChildScrollView(

          child: Column(
            children: [
              const TextoConNegrita(
                fontSize: 25,
                texto: "Tu pedido",
              ),
              const Divider(
                color: Colors.black38,
                thickness: 3,
              ),
              
              const _MyCardPedido(
                  "Empanada",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGSZU9NZXEIFylmIrCbu7D6L9g8vxRAooAWw&usqp=CAU",
                  10000,
                  100000,
                  100),
              const _MyCardPedido(
                  "Patacon",
                  "https://i.ytimg.com/vi/m3acCpS4DJg/maxresdefault.jpg",
                  10000,
                  100000,
                  100),
              const _MyCardPedido(
                  "Papa",
                  "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff",
                  10000,
                  100000,
                  100),
          
              const SizedBox(height: 10,),
              Container(
                
                constraints: const BoxConstraints(maxWidth: double.infinity),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text("RESERVAR"),
                    ),
                    const SizedBox(width: 5),
                    FilledButton(
                      onPressed: () {},
                      child: const Text("PAGAR"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  const _MyCardPedido(this.nameProduct, this.imgUrl, this.precioCobrar,
      this.totalPagar, this.cantidadVendida);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 210,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 8,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 170,
                    height: 120,
                    child: Image.network(imgUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextoConNegrita(texto: nameProduct, fontSize: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          "\$$precioCobrar  C/U",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.remove_circle_outline_rounded)),
                          const SizedBox(
                            width: 50,
                            height: 30,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.add_circle_outline_outlined)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.black54,
              thickness: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    "SubTotal:   $totalPagar",
                    style: const TextStyle(fontSize: 19),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
