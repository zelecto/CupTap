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
  List<Producto> _listaProductos=[];
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  void initState()  {
    _fetchData();
    super.initState();

  }
  

  Future<void> _fetchData() async {
    final datos = await _getProducto.getAllProducts();
    setState(() {
      _listaProductos= datos;
      _listaProductos.forEach((element) { print(element.nombre);});
    });
    
  }


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: CrearAppbar("Home", const Icon(Icons.home_outlined)),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const TextoConNegrita(
                  texto: "Bienvenido, usuario",
                  fontSize: 25,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const _ConsultarArticulosView(),
                const SizedBox(height: 5),
              ]),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 0.85
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final card = _listaProductos[index];
                return _MyCardProducto(
                   imgDefault[index],
                   card.nombre,
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
  final String title;
  

  const _MyCardProducto(this.imgUrl, this.title, );

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.screenHeight * 0.15,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              TextButton.icon(onPressed: (){}, 
                icon: Icon(Icons.add_box_outlined,color: Colors.white,), 
                label: Text("Agregar",style: TextStyle(color: Colors.white),),
                style:  TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
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

//Datos de prueba

const List<String> imgDefault=[
  "https://i.ytimg.com/vi/m3acCpS4DJg/maxresdefault.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGSZU9NZXEIFylmIrCbu7D6L9g8vxRAooAWw&usqp=CAU",
  "https://i.pinimg.com/736x/f9/d9/e9/f9d9e911bf866cbe7c9d8f2640eb2652.jpg",
  "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"
];
