class EstadoPedido {
  DateTime fechaRegistro;
  String nombre;

  EstadoPedido({
    required this.fechaRegistro,
    required this.nombre,
  });

  factory EstadoPedido.fromJson(Map<String, dynamic> json) => EstadoPedido(
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "nombre": nombre,
      };
}
