import 'package:cutap/entity/pedido/estado.dart';
import 'package:cutap/entity/pedido/venta_producto.dart';


class Pedido{
  late int? id;
  final DateTime?  fechaRegistro;
  final double? total;
  final List<DetallePedido> detalles;
  final EstadoPedido estado;
  

  Pedido({
    this.id,
    required this.fechaRegistro,
    required this.total,
    required this.detalles,
    required this.estado
  });
}

