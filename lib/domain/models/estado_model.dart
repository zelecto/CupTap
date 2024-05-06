class Estado {
    final DateTime fechaRegistro;
    final String nombre;

    Estado({
        required this.fechaRegistro,
        required this.nombre,
    });

    factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "nombre": nombre,
    };
}