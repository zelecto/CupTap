import "package:cutap/domain/models/modelos.dart";

class Pedido {
    final int id;
    final DateTime fechaRegistro;
    final double total;
    final Usuario usuario;
    final List<Detalle> detalles;
    final Estado estado;

    Pedido({
        required this.id,
        required this.fechaRegistro,
        required this.total,
        required this.usuario,
        required this.detalles,
        required this.estado,
    });

    factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json["id"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        total: json["total"],
        usuario: Usuario.fromJson(json["usuario"]),
        detalles: List<Detalle>.from(json["detalles"].map((x) => Detalle.fromJson(x))),
        estado: Estado.fromJson(json["estado"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "total": total,
        "usuario": usuario.toJson(),
        "detalles": List<dynamic>.from(detalles.map((x) => x.toJson())),
        "estado": estado.toJson(),
    };
}