import 'package:cutap/entity/pedido/estado.dart';
import 'package:cutap/entity/pedido/venta_producto.dart';


class Pedido{
  final int id;
  final DateTime  fechaRegistro;
  final double total;
  final List<VentaProducto> ventaProducto;
  final EstadoPedido estadoPedido;

  Pedido({
    required this.id,
    required this.fechaRegistro,
    required this.total,
    required this.ventaProducto,
    required this.estadoPedido
  });
}

