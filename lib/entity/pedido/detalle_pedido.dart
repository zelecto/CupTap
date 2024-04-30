import 'package:cutap/entity/producto/producto.dart';
class DetallePedido {
  int? id;
  int cantidad;
  double subtotal;
  double? valorDescontado;
  String? promocionAplicada;
  Producto producto;

  DetallePedido({
    this.id,
    required this.cantidad,
    required this.subtotal,
    this.valorDescontado,
    this.promocionAplicada,
    required this.producto,
  });

  factory DetallePedido.fromJson(Map<String, dynamic> json) => DetallePedido(
        id: json["id"],
        cantidad: json["cantidad"],
        subtotal: json["subtotal"]?.toDouble(),
        valorDescontado: json["valor_descontado"]?.toDouble(),
        promocionAplicada: json["promocion_aplicada"],
        producto: Producto.fromJson(json["producto"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "subtotal": subtotal,
        "valor_descontado": valorDescontado,
        "promocion_aplicada": promocionAplicada,
        "producto": producto.toJson(),
      };
}
