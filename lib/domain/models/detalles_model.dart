import "package:cutap/domain/models/modelos.dart";

class Detalle {
    final int id;
    final int cantidad;
    final double subtotal;
    final double valorDescontado;
    final String? promocionAplicada;
    final Producto producto;
    final DateTime fechaRegistro;

    Detalle({
        required this.id,
        required this.cantidad,
        required this.subtotal,
        required this.valorDescontado,
        this.promocionAplicada,
        required this.producto,
        required this.fechaRegistro,
    });

    factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        id: json["id"],
        cantidad: json["cantidad"],
        subtotal: json["subtotal"],
        valorDescontado: json["valor_descontado"],
        promocionAplicada: json["promocion_aplicada"],
        producto: Producto.fromJson(json["producto"]),
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "subtotal": subtotal,
        "valor_descontado": valorDescontado,
        "promocion_aplicada": promocionAplicada,
        "producto": producto.toJson(),
        "fechaRegistro": fechaRegistro.toIso8601String(),
    };
}