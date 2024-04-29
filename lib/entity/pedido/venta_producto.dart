import 'package:cutap/entity/producto/producto.dart';

class DetallePedido {
  final int cantidaVendida;
  final double subPrecioCobro;
  final Producto producto;

  DetallePedido(
      {required this.cantidaVendida,
      required this.subPrecioCobro,
      required this.producto
      }
    );
}
