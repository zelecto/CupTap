

import 'package:cutap/Base/producto/consulta_producto.dart';
import 'package:cutap/config/Screeb/screen_size.dart';
import 'package:cutap/entity/producto/producto.dart';
import 'package:flutter/material.dart';
import 'package:cutap/presentation/screens/Widgets/widgets_reutilizables.dart';



class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GetProducto _getProducto = GetProducto();
  List<Producto> _listaProductos = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final datos = await _getProducto.getAllProducts();
    if (mounted)
      setState(() {
        _listaProductos = datos;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrearAppbar("Home", const Icon(Icons.home_outlined)),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const TextoConNegrita(
                  texto: "Bienvenido, usuario",
                  fontSize: 25,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const _ConsultarArticulosView(),
              ]),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, childAspectRatio: 0.85),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _MyCardProducto(
                  imgUrl: imgDefault[index],
                  producto: _listaProductos[index],
                );
              },
              childCount: _listaProductos.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyCardProducto extends StatelessWidget {
  final String imgUrl;
  final Producto producto;

  const _MyCardProducto({
    required this.imgUrl,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
          ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: ScreenSize.screenHeight * 0.18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            
            Positioned(
              right: 0,
              child: Container(
                width: ScreenSize.screenWidth*0.08,
                height: ScreenSize.screenHeight*0.04,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline_outlined,size: 20,color: Color.fromARGB(255, 6, 229, 13),)),
              ),
            ),

            Positioned(
              bottom: 0,
              child: SizedBox(
                width: ScreenSize.screenWidth*0.50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Center(child: TextoConNegrita(texto: producto.nombre.toUpperCase(), fontSize: 20)),
                        Text("${producto.stock} Disponible",
                          style:  TextStyle(fontSize: 15,color: Colors.grey.shade500),
                        ),
                        Row(
                          children: [
                            TextoConNegrita(texto: "${producto.precio}",fontSize: 15,color: Colors.blue,),
                            const Icon(Icons.attach_money_rounded,size: 15,color: Colors.blue,)
                          ],
                        )
                      ],
                  ),
                ),
              ),
            )
          
          ],

          
        ),
      ),
    );
  }
}

class _ConsultarArticulosView extends StatelessWidget {
  const _ConsultarArticulosView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: TextoConNegrita(
          texto: "Nuestra lista de artículos",
          fontSize: 25,
        ),
      ),
    );
  }
}

// class _BottomSheetsAgregarVenta extends StatelessWidget {
//   final Producto producto;
//   const _BottomSheetsAgregarVenta({required this.producto});

//   @override
//   Widget build(BuildContext context) {
//     return const ButtomShett();
//   }
// }





//Datos de prueba 
const List<String> imgDefault = [
  "https://i.ytimg.com/vi/m3acCpS4DJg/maxresdefault.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGSZU9NZXEIFylmIrCbu7D6L9g8vxRAooAWw&usqp=CAU",
  "https://i.pinimg.com/736x/f9/d9/e9/f9d9e911bf866cbe7c9d8f2640eb2652.jpg",
  "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"
];
