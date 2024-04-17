import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cutap/presentation/screens/Widgets/widgets_reutilizables.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home();

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
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const _ConsultarArticulosView(),
                const Divider(color: Colors.black38,thickness: 3,),
                const SizedBox(height: 5),
              ]),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final card = cards[index];
                return MyCardProducto(
                  card['imgUrl'],
                  card['label'],
                  card['Disiponible'],
                  card['elevation'],
                );
              },
              childCount: cards.length,
            ),
          ),
        ],
      ),
    );
  }
}


const cards = <Map<String, dynamic>>[
  {'elevation': 1.0, 'label': 'Empanada','Disiponible' : 10,
   'imgUrl': "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGSZU9NZXEIFylmIrCbu7D6L9g8vxRAooAWw&usqp=CAU"},
  {'elevation': 1.0, 'label': 'Patacon','Disiponible' : 20,
   'imgUrl': "https://i.ytimg.com/vi/m3acCpS4DJg/maxresdefault.jpg"},
  {'elevation': 2.0, 'label': 'Dedito','Disiponible' : 10,
   'imgUrl': "https://i.pinimg.com/736x/f9/d9/e9/f9d9e911bf866cbe7c9d8f2640eb2652.jpg"},
  {'elevation': 2.0, 'label': 'Papa','Disiponible' : 10,
   'imgUrl': "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"},
  {'elevation': 2.0, 'label': 'Papa','Disiponible' : 10,
   'imgUrl': "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"},
  {'elevation': 2.0, 'label': 'Papa','Disiponible' : 10,
   'imgUrl': "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"},
  {'elevation': 2.0, 'label': 'Papa','Disiponible' : 10,
   'imgUrl': "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"},
  {'elevation': 2.0, 'label': 'Papa','Disiponible' : 10,
   'imgUrl': "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"},
  {'elevation': 2.0, 'label': 'Papa','Disiponible' : 10,
   'imgUrl': "https://mojo.generalmills.com/api/public/content/E7Xi4th4mk-_NectBDhpNg_gmi_hi_res_jpeg.jpeg?v=6106f73d&t=16e3ce250f244648bef28c5949fb99ff"},
  
];


class MyCardProducto extends StatelessWidget {
  final String imgUrl;
  final String title;
  final int number;
  final double elevation;

  
  const MyCardProducto(this.imgUrl, this.title, this.number, this.elevation);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () {
      },
      child: Card(
        surfaceTintColor: Colors.purple,
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                imgUrl,
                fit: BoxFit.contain,
                width: 100,
                height: 115,
              ),
              const SizedBox(height: 8),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const TextoConNegrita(
            texto: "Nuestra lista de artículos",
            fontSize: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: TextButton(
              onPressed: () {
      
              },
              style: const ButtonStyle(
              ),
              child: const Text(
                "Ver todo",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }
}
