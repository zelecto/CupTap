import 'package:cutap/domain/models/pedidos_model.dart';
import 'package:cutap/presentation/widgets/admin/Home/pedido_subitem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PedidosCard extends StatelessWidget {
  final Pedido pedido;

  const PedidosCard({super.key, required this.pedido});

  Color getColor(String estado) {
    if (estado == 'Realizado') {
      return Colors.green;
    } else if (estado == 'Pendiente') {
      return Colors.orange;
    } else {
      return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 180,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orden #${pedido.id.toString()}',
                      style: const TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                        NumberFormat.currency(symbol: 'COP\$', decimalDigits: 0)
                            .format(pedido.total),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: getColor(pedido.estado.nombre),
                        ))
                  ],
                ),
              ),
              const OrderSubitem(
                  iconData: Icons.location_on_outlined,
                  text: 'Gladesville NSW 2111, Australia'),
              const OrderSubitem(
                iconData: Icons.calendar_today,
                text: 'On Sun, 28 Apr',
              ),
              const OrderSubitem(
                iconData: Icons.access_time_outlined,
                text: 'Afternoon',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pedido.estado.nombre == 'Realizado'
                          ? pedido.estado.nombre
                          : 'Pendiente',
                      style: TextStyle(
                          fontSize: 13,
                          color: getColor(pedido.estado.nombre),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //TODO: realizar reel de imagenes
          Positioned(
            bottom: 20,
            right: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Image(
                  image: pedido.detalles[0].producto.imagen,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
