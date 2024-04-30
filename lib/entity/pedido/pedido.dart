import 'package:cutap/entity/pedido/estado.dart';
import 'package:cutap/entity/pedido/detalle_pedido.dart';


class Pedido{
  final int id;
  final DateTime  fechaRegistro;
  final double total;
  final List<DetallePedido> detalles;
  final EstadoPedido estado;
  

  Pedido({
    required this.id,
    required this.fechaRegistro,
    required this.total,
    required this.detalles,
    required this.estado
  });

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json["id"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        total: json["total"]?.toDouble(),
        detalles: List<DetallePedido>.from(json["detalles"].map((x) => DetallePedido.fromJson(x))),
        estado: EstadoPedido.fromJson(json["estado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaRegistro": fechaRegistro,
        "total": total,
      };
}

