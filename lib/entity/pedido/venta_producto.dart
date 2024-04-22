import 'package:cutap/entity/producto/producto.dart';

class VentaProducto {
  final int cantidaVendida;
  final double subPrecioCobro;
  final Producto producto;

  VentaProducto(
      {required this.cantidaVendida,
      required this.subPrecioCobro,
      required this.producto
      }
    );
}
