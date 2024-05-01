import 'package:cutap/entity/pedido/estado.dart';
import 'package:cutap/entity/pedido/detalle_pedido.dart';

//TODO Agregar usuario
class Pedido {
  final int? id;
  final DateTime? fechaRegistro;
  final double? total;
  final List<DetallePedido> detalles;
  final EstadoPedido estado;

  Pedido(
      {this.id,
      this.fechaRegistro,
      this.total,
      required this.detalles,
      required this.estado});

  Pedido copyWhit(
      int? id, DateTime? fechaRegistro, double? total, List<DetallePedido>? detalles, EstadoPedido? estado) =>  
      Pedido(
        id: id ?? this.id,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        total: total ?? this.total,
        detalles: detalles ?? this.detalles,
        estado: estado ?? this.estado,
        );

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json["id"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        total: json["total"]?.toDouble(),
        detalles: List<DetallePedido>.from(
            json["detalles"].map((x) => DetallePedido.fromJson(x))),
        estado: EstadoPedido.fromJson(json["estado"]),
      );

  Map<String, dynamic> toJson() => {
        "usuario": {"cedula": "1003238420"},
        "estado": estado.toJson(),
        "detalles": List<dynamic>.from(detalles.map((x) => x.toJson())),
      };
}
